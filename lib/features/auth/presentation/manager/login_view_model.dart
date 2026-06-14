import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/cache/shared_prefrence_utils.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/login_use_case.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;

  LoginViewModel(
    this.loginUseCase, {
    @factoryParam String? initialEmail,
    @factoryParam String? initialPassword,
  }) : super(LoginInitialState()) {
    if (initialEmail != null) {
      emailController.text = initialEmail;
    }
    if (initialPassword != null) {
      passwordController.text = initialPassword;
    }
  }

  static LoginViewModel get(BuildContext context) =>
      BlocProvider.of<LoginViewModel>(context);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  bool isPasswordVisible = false;

  void toggleRememberMe(bool value) {
    rememberMe = value;
    emit(LoginUpdateState());
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginUpdateState());
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      emit(const LoginErrorState('Please fill out all fields correctly'));
      return;
    }

    emit(LoginLoadingState());

    final result = await loginUseCase.call(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    await result.fold(
          (failure) async {
        final message = failure is ServerError
            ? failure.errorMessage
            : 'Login failed. Please try again.';
        emit(LoginErrorState(message));
      },
          (entity) async {
        debugPrint(
            'Login Success API Response: Name=${entity.name}, Role=${entity
                .role}');

        if (entity.userId != null) {
          await SharedPreferenceUtils.saveData(
              key: 'user_id', value: entity.userId!);
        }

        // 1. Determine Display Name (Handle Odoo "false" strings and nulls)
        String displayName = '';
        if (entity.name != null && entity.name != "false" && entity.name!
            .toString()
            .trim()
            .isNotEmpty) {
          displayName = entity.name!;
        } else if (emailController.text.isNotEmpty) {
          displayName = emailController.text.split('@')[0];
        } else {
          displayName = "User";
        }

        // 2. Determine Role
        String displayRole = "Employee";
        if (entity.role != null && entity.role != "false" && entity.role!
            .toString()
            .trim()
            .isNotEmpty) {
          displayRole = entity.role!;
        }

        // 3. Force Wait for saving
        await SharedPreferenceUtils.saveData(
            key: 'user_name', value: displayName);
        await SharedPreferenceUtils.saveData(
            key: 'user_role', value: displayRole);

        if (entity.companyName != null && entity.companyName != "false") {
          await SharedPreferenceUtils.saveData(
              key: 'company_name', value: entity.companyName!);
        }

        debugPrint('LocalStorage Verified: Saved Name -> ${SharedPreferenceUtils
            .getData(key: 'user_name')}');

        emit(LoginSuccessState(entity));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}

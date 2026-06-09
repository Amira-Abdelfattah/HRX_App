import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

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

    result.fold(
      (failure) {
        final message = failure is ServerError
            ? failure.errorMessage
            : 'Login failed. Please try again.';
        emit(LoginErrorState(message));
      },
      (entity) {
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/api/api_manager.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../main_layout.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/hrx_gradient_bg.dart';
import '../../data/datasources/auth_remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_use_case.dart';
import '../manager/login_states.dart';
import '../manager/login_view_model.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/login_form.dart';
import 'register.dart';

class LoginScreen extends StatelessWidget {
  final String? initialEmail;
  final String? initialPassword;

  const LoginScreen({
    super.key,
    this.initialEmail,
    this.initialPassword,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginViewModel(
            LoginUseCase(
              AuthRepositoryImpl(AuthRemoteDataSourceImpl(ApiManager.instance)),
            ),
            initialEmail: initialEmail,
            initialPassword: initialPassword,
          ),
      child: BlocConsumer<LoginViewModel, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            DialogUtils.showLoading(context: context, message: 'Signing in...');
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MainLayout()),
            );
          }
        },
        builder: (context, state) {
          final vm = LoginViewModel.get(context);
          return Scaffold(
            body: HrxGradientBackground(
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),
                      const AuthHeader(
                        title: 'Sign in to HR Saas',
                        subtitle: 'Welcome back! Please enter your details.',
                        showLogo: false,
                      ),
                      SizedBox(height: 40.h),
                      LoginForm(vm: vm),
                      SizedBox(height: 30.h),
                      CustomElevatedButton(
                        text: 'Sign in',
                        backgroundColor: AppColors.accentColor,
                        textStyle: AppStyles.semi20Primary().copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        onButtonClicked: vm.login,
                      ),
                      SizedBox(height: 24.h),
                      AuthFooter(
                        text: "Don't have an account? ",
                        linkText: 'Sign up',
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

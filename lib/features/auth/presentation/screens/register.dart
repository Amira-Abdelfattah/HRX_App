import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cache/shared_prefrence_utils.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/navigator_key.dart';
import '../../../payment/presentation/screens/payment_screen.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/hrx_gradient_bg.dart';
import '../manager/register_states.dart';
import '../manager/register_view_model.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/register_form.dart';
import 'login.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterViewModel>(),
      child: BlocConsumer<RegisterViewModel, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogUtils.showLoading(context: context, message: 'Loading...');
          } else if (state is RegisterErrorState) {
            DialogUtils.hideLoading(context);
            DialogUtils.showMessage(context: context, message: state.message);
          } else if (state is RegisterSuccessState) {
            DialogUtils.hideLoading(context);
            var vm = RegisterViewModel.get(context);

            final userName = vm.nameController.text;
            final userRole = vm.selectedRole;
            final companyName = vm.companyController.text;

            // Save data to SharedPreferences and wait for it
            Future.wait([
              SharedPreferenceUtils.saveData(key: 'user_name', value: userName),
              SharedPreferenceUtils.saveData(key: 'user_role', value: userRole),
              SharedPreferenceUtils.saveData(
                key: 'company_name',
                value: companyName,
              ),
            ]);
            final userData = {
              'name': userName,
              'email': vm.emailController.text,
              'password': vm.passwordController.text,
              'company': companyName,
              'role': userRole,
            };

            DialogUtils.showMessage(
              context: context,
              message: 'Account initialized. Please proceed to payment to activate your workspace.',
              posActionName: 'Proceed to Payment',
              posAction: () {
                Future.delayed(const Duration(milliseconds: 120), () {
                  navigatorKey.currentState?.pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        userData: userData,
                      ),
                    ),
                  );
                });
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: HrxGradientBackground(
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      const AuthHeader(
                        title: 'Subscribe to HR Saas',
                        subtitle: 'Enter details to create your account',
                      ),
                      SizedBox(height: 40.h),
                      const RegisterForm(),
                      SizedBox(height: 30.h),
                      CustomElevatedButton(
                        text: 'Subscribe',
                        backgroundColor: AppColors.accentColor,
                        textStyle: AppStyles.semi20Primary().copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        onButtonClicked: () {
                          RegisterViewModel.get(context).register();
                        },
                      ),
                      SizedBox(height: 24.h),
                      AuthFooter(
                        text: 'Already have an account? ',
                        linkText: 'Sign In',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
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

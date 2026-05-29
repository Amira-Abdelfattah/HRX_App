import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/hrx_gradient_bg.dart';
import 'login.dart';
import 'widgets/auth_footer.dart';
import 'widgets/auth_header.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  title: 'Sign up to HR Saas',
                  subtitle: 'Enter details to create your account',
                ),
                SizedBox(height: 40.h),
                const RegisterForm(),
                SizedBox(height: 30.h),
                CustomElevatedButton(
                  text: 'Sign up',
                  backgroundColor: AppColors.accentColor,
                  textStyle: AppStyles.semi20Primary().copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  onButtonClicked: () {},
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
  }
}

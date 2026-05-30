import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';
import '../main_layout.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/hrx_gradient_bg.dart';
import 'register.dart';
import 'widgets/auth_footer.dart';
import 'widgets/auth_header.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                SizedBox(height: 40.h),
                const AuthHeader(
                  title: 'Sign in to HR Saas',
                  subtitle: 'Welcome back! Please enter your details.',
                  showLogo: false,
                ),
                SizedBox(height: 40.h),
                const LoginForm(),
                SizedBox(height: 30.h),
                CustomElevatedButton(
                  text: 'Sign in',
                  backgroundColor: AppColors.accentColor,
                  textStyle: AppStyles.semi20Primary().copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  onButtonClicked: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainLayout()),
                    );
                  },
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
  }
}

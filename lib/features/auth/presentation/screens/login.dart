import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/cache/shared_prefrence_utils.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../main_layout.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/hrx_gradient_bg.dart';
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
          getIt<LoginViewModel>(
            param1: initialEmail,
            param2: initialPassword,
          ),
      child: BlocConsumer<LoginViewModel, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            DialogUtils.showLoading(
                context: context, message: 'signing_in'.tr());
          } else if (state is LoginErrorState) {
            DialogUtils.hideLoading(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is LoginSuccessState) {
            DialogUtils.hideLoading(context);

            final String savedName = SharedPreferenceUtils.getData(
                key: 'user_name') as String? ?? state.response.name ?? 'User';
            final String savedRole = SharedPreferenceUtils.getData(
                key: 'user_role') as String? ?? state.response.role ??
                'Employee';

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MainLayout(
                      userName: savedName,
                      userRole: savedRole,
                    ),
              ),
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
                      AuthHeader(
                        title: 'sign_in_title'.tr(),
                        subtitle: 'welcome_back'.tr(),
                        showLogo: false,
                      ),
                      SizedBox(height: 40.h),
                      LoginForm(vm: vm),
                      SizedBox(height: 30.h),
                      CustomElevatedButton(
                        text: 'sign_in_btn'.tr(),
                        backgroundColor: AppColors.accentColor,
                        textStyle: AppStyles
                            .semi20Primary(context: context)
                            .copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        onButtonClicked: vm.login,
                      ),
                      SizedBox(height: 24.h),
                      AuthFooter(
                        text: "no_account".tr(),
                        linkText: 'sign_up'.tr(),
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

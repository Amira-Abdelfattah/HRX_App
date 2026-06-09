import 'package:animated_payment_card/animated_payment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../auth/presentation/screens/login.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_txt_field.dart';
import '../manager/payment_states.dart';
import '../manager/payment_view_model.dart';
import 'payment_summary.dart';

class PaymentCardSection extends StatelessWidget {
  final PaymentViewModel vm;
  final Map<String, dynamic> userData;

  const PaymentCardSection({super.key, required this.vm, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 180.h,
          child: CreditCardWidget(
            cardNumber: vm.cardNumberController.text,
            expiryDate: vm.expiryController.text,
            cardHolderName: vm.nameController.text,
            cvvCode: vm.cvvController.text,
            showBackView: vm.isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            cardType: CreditCardBrand.visa,
            onCreditCardWidgetChange: (brand) {},
            height: 150.h,
          ),
        ),
        SizedBox(height: 30.h),
        _buildLabel('CARDHOLDER NAME'),
        _buildTextField(
          vm.nameController,
          'Name on card',
          Icons.person_outline,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Cardholder name is required';
            }
            return null;
          },
        ),
        _buildLabel('CARD NUMBER'),
        _buildTextField(
          vm.cardNumberController,
          '4000 1234 5678 9010',
          Icons.credit_card,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Card number is required';
            }
            if (value.replaceAll(' ', '').length < 16) {
              return 'Enter a valid 16-digit card number';
            }
            return null;
          },
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('EXPIRATION DATE'),
                  _buildTextField(
                    vm.expiryController,
                    'MM/YY',
                    Icons.calendar_today_outlined,
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Required';
                      }
                      if (!RegExp(
                        r'^(0[1-9]|1[0-2])\/?([0-9]{2})$',
                      ).hasMatch(value)) {
                        return 'Invalid format';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('CVV / CODE'),
                  _buildTextField(
                    vm.cvvController,
                    '***',
                    Icons.lock_outline,
                    keyboardType: TextInputType.number,
                    focusNode: vm.cvvFocusNode,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Required';
                      }
                      if (value.length < 3) {
                        return 'Invalid';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        _buildLabel('PROMO COUPON'),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildTextField(
                TextEditingController(),
                'Code (Try HRXPRO)',
                Icons.percent,
              ),
            ),
            SizedBox(width: 10.w),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Apply',
                  style: AppStyles.bold20PrimaryDark(
                    color: Colors.white,
                  ).copyWith(fontSize: 14.sp),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        PaymentSummary(
          isAnnual: vm.isAnnual,
          selectedPlanIndex: vm.selectedPlanIndex,
        ),
        SizedBox(height: 30.h),
        BlocConsumer<PaymentViewModel, PaymentStates>(
          listener: (context, state) {
            if (state is PaymentSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            } else if (state is PaymentErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            return CustomElevatedButton(
              text: state is PaymentLoadingState
                  ? 'Processing...'
                  : 'Pay & Activate ${vm.selectedPlanIndex == 0 ? "Starter" : "Premium Suite"}',
              backgroundColor: AppColors.accentColor,
              textStyle: AppStyles.bold20PrimaryDark(
                color: AppColors.primaryColor,
              ).copyWith(fontSize: 16.sp),
              onButtonClicked: state is PaymentLoadingState
                  ? () {}
                  : () => vm.processPayment(
                        name: userData['name'] ?? '',
                        email: userData['email'] ?? '',
                        password: userData['password'] ?? '',
                        role: userData['role'] ?? '',
                        companyName: userData['company'] ?? '',
                      ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h, top: 8.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: AppStyles.bold20PrimaryDark(
            color: Colors.white,
          ).copyWith(fontSize: 12.sp),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon, {
    TextInputType? keyboardType,
    FocusNode? focusNode,
    String? Function(String?)? validator,
  }) {
    return CustomTextField(
      controller: controller,
      hintText: hint,
      prefixIcon: Icon(icon, color: Colors.white54, size: 20.sp),
      filledColor: const Color(0xff1E3A73),
      borderColor: Colors.transparent,
      style: AppStyles.medium14Category(color: Colors.white),
      hintStyle: AppStyles.regular14Grey(color: Colors.white30),
      keyboardType: keyboardType,
      focusNode: focusNode,
      validator: validator,
    );
  }
}

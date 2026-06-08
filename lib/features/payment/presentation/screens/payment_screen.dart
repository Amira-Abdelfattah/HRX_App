import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/dialog_utils.dart';
import '../../../widgets/hrx_gradient_bg.dart';
import '../manager/payment_states.dart';
import '../manager/payment_view_model.dart';
import '../widgets/payment_app_bar.dart';
import '../widgets/payment_billing_section.dart';
import '../widgets/payment_card_section.dart';
import '../widgets/payment_header.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentViewModel()..init(),
      child: BlocConsumer<PaymentViewModel, PaymentStates>(
        listener: _handleStates,
        builder: (context, state) {
          var vm = PaymentViewModel.get(context);
          return Scaffold(
            body: HrxGradientBackground(
              child: SafeArea(
                child: Column(
                  children: [
                    const PaymentAppBar(),
                    Expanded(child: _buildBody(vm)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(PaymentViewModel vm) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Form(
        key: vm.formKey,
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const PaymentHeader(),
            SizedBox(height: 30.h),
            _buildResponsiveLayout(vm),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  void _handleStates(BuildContext context, PaymentStates state) {
    if (state is PaymentLoadingState) {
      DialogUtils.showLoading(
        context: context,
        message: 'Processing Payment...',
      );
    } else if (state is PaymentSuccessState) {
      DialogUtils.hideLoading(context);
      DialogUtils.showMessage(
        context: context,
        message: 'Subscription Activated Successfully!',
        posActionName: 'Great!',
        posAction: () => Navigator.pop(context),
      );
    } else if (state is PaymentErrorState) {
      DialogUtils.hideLoading(context);
      Fluttertoast.showToast(
        msg: state.message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 14.sp,
      );
    }
  }

  Widget _buildResponsiveLayout(PaymentViewModel vm) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;
        if (isDesktop) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: PaymentBillingSection(vm: vm)),
              SizedBox(width: 40.w),
              Expanded(child: PaymentCardSection(vm: vm)),
            ],
          );
        }
        return Column(
          children: [
            PaymentBillingSection(vm: vm),
            SizedBox(height: 40.h),
            PaymentCardSection(vm: vm),
          ],
        );
      },
    );
  }
}

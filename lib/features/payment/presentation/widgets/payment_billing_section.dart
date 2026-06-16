import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/payment_view_model.dart';
import 'benefits_list.dart';
import 'billing_toggle.dart';
import 'plan_card.dart';

class PaymentBillingSection extends StatelessWidget {
  final PaymentViewModel vm;

  const PaymentBillingSection({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BillingToggle(
          isAnnual: vm.isAnnual,
          onToggle: (val) => vm.toggleBilling(val),
        ),
        SizedBox(height: 30.h),
        Row(
          children: [
            Expanded(
              child: PlanCard(
                title: 'starter'.tr(),
                description: 'starter_desc'.tr(),
                price: vm.isAnnual ? '\$24' : '\$29',
                period: 'per_month'.tr(),
                isSelected: vm.selectedPlanIndex == 0,
                onTap: () => vm.selectPlan(0),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: PlanCard(
                title: 'premium_suite'.tr(),
                description: 'premium_suite_desc'.tr(),
                price: vm.isAnnual ? '\$49' : '\$59',
                period: 'per_month'.tr(),
                isSelected: vm.selectedPlanIndex == 1,
                isPopular: true,
                onTap: () => vm.selectPlan(1),
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        const BenefitsList(),
      ],
    );
  }
}

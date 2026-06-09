import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class PaymentSummary extends StatelessWidget {
  final bool isAnnual;
  final int selectedPlanIndex;

  const PaymentSummary({
    super.key,
    required this.isAnnual,
    required this.selectedPlanIndex,
  });

  @override
  Widget build(BuildContext context) {
    double basePrice = selectedPlanIndex == 0
        ? (isAnnual ? 288.0 : 29.0)
        : (isAnnual ? 588.0 : 59.0);
    String label = isAnnual
        ? 'Base Subscription (annual)'
        : 'Base Subscription (monthly)';
    double vat = basePrice * 0.05;
    double total = basePrice + vat;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          _summaryRow(label, '\$${basePrice.toStringAsFixed(2)}'),
          _summaryRow('Subtotal', '\$${basePrice.toStringAsFixed(2)}'),
          _summaryRow('VAT (5%)', '\$${vat.toStringAsFixed(2)}'),
          const Divider(color: Colors.white12),
          _summaryRow(
            'Total Amount Billed',
            '\$${total.toStringAsFixed(2)}',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isTotal
                ? AppStyles.bold20PrimaryDark(
                    color: Colors.white,
                  ).copyWith(fontSize: 14.sp)
                : AppStyles.regular12Grey(color: Colors.white60),
          ),
          Text(
            value,
            style: isTotal
                ? AppStyles.bold20PrimaryDark(
                    color: AppColors.accentColor,
                  ).copyWith(fontSize: 16.sp)
                : AppStyles.regular12Grey(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

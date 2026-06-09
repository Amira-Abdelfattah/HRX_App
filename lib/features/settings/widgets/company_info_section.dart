import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_txt_field.dart';
import 'setting_section_card.dart';

class CompanyInfoSection extends StatelessWidget {
  const CompanyInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingSectionCard(
      title: 'Company Information',
      subtitle: 'Update your company details',
      icon: Icons.business_outlined,
      child: Column(
        children: [
          const CustomTextField(
            hintText: 'e.g. Acme Corporation',
            labelText: 'Company Name',
          ),
          Row(
            children: [
              Expanded(
                child: const CustomTextField(
                  hintText: 'Technology',
                  labelText: 'Industry',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: const CustomTextField(
                  hintText: '100-500',
                  labelText: 'Company Size',
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                ),
              ),
            ],
          ),
          const CustomTextField(
            hintText: '123 Main St, San Francisco, CA 94105',
            labelText: 'Address',
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

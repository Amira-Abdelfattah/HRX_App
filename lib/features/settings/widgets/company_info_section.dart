import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_txt_field.dart';
import 'setting_section_card.dart';

class CompanyInfoSection extends StatelessWidget {
  const CompanyInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingSectionCard(
      title: 'company_information'.tr(),
      subtitle: 'update_company_details'.tr(),
      icon: Icons.business_outlined,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'company_name_hint'.tr(),
            labelText: 'company_name'.tr(),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'tech_hint'.tr(),
                  labelText: 'industry'.tr(),
                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomTextField(
                  hintText: 'size_hint'.tr(),
                  labelText: 'company_size'.tr(),
                ),
              ),
            ],
          ),
          CustomTextField(
            hintText: 'address_hint'.tr(),
            labelText: 'address'.tr(),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

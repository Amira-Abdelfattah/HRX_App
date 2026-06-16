import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/cache/shared_prefrence_utils.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../widgets/custom_txt_field.dart';
import 'setting_section_card.dart';

class CompanyInfoSection extends StatefulWidget {
  const CompanyInfoSection({super.key});

  @override
  State<CompanyInfoSection> createState() => _CompanyInfoSectionState();
}

class _CompanyInfoSectionState extends State<CompanyInfoSection> {
  final TextEditingController _companyNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCompanyData();
  }

  void _loadCompanyData() {
    final savedCompany = SharedPreferenceUtils.getData(
        key: 'company_name') as String?;
    if (savedCompany != null && savedCompany != "false") {
      _companyNameController.text = savedCompany;
    }
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SettingSectionCard(
      title: 'company_information'.tr(),
      subtitle: 'update_company_details'.tr(),
      icon: Icons.business_outlined,
      child: Column(
        children: [
          CustomTextField(
            controller: _companyNameController,
            hintText: 'company_name_hint'.tr(),
            labelText: 'company_name'.tr(),
            labelStyle: AppStyles.regular14Grey(context: context),
            style: AppStyles.medium14PrimaryDarkName(
                context: context, color: AppColors.primaryColor),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  hintText: 'tech_hint'.tr(),
                  labelText: 'industry'.tr(),
                  suffixIcon: const Icon(Icons.keyboard_arrow_down),
                  labelStyle: AppStyles.regular14Grey(context: context),
                  style: AppStyles.medium14PrimaryDarkName(
                      context: context, color: AppColors.primaryColor),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomTextField(
                  hintText: 'size_hint'.tr(),
                  labelText: 'company_size'.tr(),
                  labelStyle: AppStyles.regular14Grey(context: context),
                  style: AppStyles.medium14PrimaryDarkName(
                      context: context, color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          CustomTextField(
            hintText: 'address_hint'.tr(),
            labelText: 'address'.tr(),
            maxLines: 2,
            labelStyle: AppStyles.regular14Grey(context: context),
            style: AppStyles.medium14PrimaryDarkName(
                context: context, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}

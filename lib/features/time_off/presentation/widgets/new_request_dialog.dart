import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../features/widgets/custom_elevated_button.dart';
import '../../../../features/widgets/custom_txt_field.dart';
import '../../domain/entities/time_off_type_entity.dart';
import '../manager/time_off_cubit.dart';
import '../manager/time_off_states.dart';

class NewRequestDialog extends StatefulWidget {
  final List<TimeOffTypeEntity> types;

  const NewRequestDialog({super.key, required this.types});

  @override
  State<NewRequestDialog> createState() => _NewRequestDialogState();
}

class _NewRequestDialogState extends State<NewRequestDialog> {
  final _formKey = GlobalKey<FormState>();
  TimeOffTypeEntity? _selectedType;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _reasonController = TextEditingController();
  DateTime? _startDate;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocListener<TimeOffCubit, TimeOffStates>(
      listener: (context, state) {
        if (state is TimeOffRequestSuccessState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('request_submitted'.tr())),
          );
        } else if (state is TimeOffRequestErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Dialog(
        backgroundColor: isDark
            ? AppColors.darkSurfaceColor
            : AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: 0.9.sw,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  color: AppColors.primaryColor,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'request_time_off'.tr(),
                              style: AppStyles.semi16White,
                            ),
                            Text(
                              'submit_new_request'.tr(),
                              style: AppStyles.regular12Grey(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                // Form Content
                Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'leave_type'.tr(),
                          style: AppStyles.medium14PrimaryDark(
                            context: context,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        DropdownButtonFormField<TimeOffTypeEntity>(
                          initialValue: _selectedType,
                          isExpanded: true,
                          dropdownColor: isDark
                              ? AppColors.darkSurfaceColor
                              : AppColors.whiteColor,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: widget.types.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(
                                type.displayName,
                                style: AppStyles.regular14Grey(
                                  context: context,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedType = value;
                            });
                          },
                          validator: (value) => value == null
                              ? 'select_leave_type'.tr()
                              : null,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(
                                color: AppColors.borderColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide(
                                color: AppColors.borderColor.withValues(
                                    alpha: 0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'start_date'.tr(),
                                    style: AppStyles.medium14PrimaryDark(
                                      context: context,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  CustomTextField(
                                    hintText: 'date_format_hint'.tr(),
                                    controller: _startDateController,
                                    readOnly: true,
                                    prefixIcon: const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 18,
                                    ),
                                    onTap: () async {
                                      final date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now().add(
                                          const Duration(days: 365),
                                        ),
                                      );
                                      if (date != null && mounted) {
                                        _startDate = date;
                                        _startDateController.text = DateFormat(
                                          'MM/dd/yyyy',
                                          context.locale.languageCode,
                                        ).format(date);
                                      }
                                    },
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'required'.tr()
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'end_date'.tr(),
                                    style: AppStyles.medium14PrimaryDark(
                                      context: context,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  CustomTextField(
                                    hintText: 'date_format_hint'.tr(),
                                    controller: _endDateController,
                                    readOnly: true,
                                    prefixIcon: const Icon(
                                      Icons.calendar_today_outlined,
                                      size: 18,
                                    ),
                                    onTap: () async {
                                      final date = await showDatePicker(
                                        context: context,
                                        initialDate:
                                            _startDate ?? DateTime.now(),
                                        firstDate: _startDate ?? DateTime.now(),
                                        lastDate: DateTime.now().add(
                                          const Duration(days: 365),
                                        ),
                                      );
                                      if (date != null && mounted) {
                                        _endDateController.text = DateFormat(
                                          'MM/dd/yyyy',
                                          context.locale.languageCode,
                                        ).format(date);
                                      }
                                    },
                                    validator: (value) =>
                                        value == null || value.isEmpty
                                            ? 'required'.tr()
                                        : null,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'reason'.tr(),
                          style: AppStyles.medium14PrimaryDark(
                            context: context,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CustomTextField(
                          hintText:
                          'reason_hint'.tr(),
                          controller: _reasonController,
                          maxLines: 3,
                          validator: (value) => value == null || value.isEmpty
                              ? 'provide_reason'.tr()
                              : null,
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 14.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  side: BorderSide(
                                    color: AppColors.borderColor,
                                  ),
                                ),
                                child: Text(
                                  'cancel'.tr(),
                                  style: AppStyles.semi14PrimaryDark(
                                    context: context,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: BlocBuilder<TimeOffCubit, TimeOffStates>(
                                builder: (context, state) {
                                  return CustomElevatedButton(
                                    backgroundColor: const Color(0xff00CFE8),
                                    onButtonClicked: () {
                                      if (_formKey.currentState!.validate()) {
                                        context
                                            .read<TimeOffCubit>()
                                            .requestTimeOff(
                                              typeId: _selectedType!.id,
                                              typeName:
                                                  _selectedType!.displayName,
                                              startDate:
                                                  _startDateController.text,
                                              endDate: _endDateController.text,
                                              reason: _reasonController.text,
                                            );
                                      }
                                    },
                                    text: state is TimeOffRequestLoadingState
                                        ? 'submitting'.tr()
                                        : 'submit_request'.tr(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


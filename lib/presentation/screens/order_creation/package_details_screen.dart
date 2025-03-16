import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/utils/validators.dart';
import 'package:baridx_orderflow/logic/cubits/package_details_cubit.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glass_dropdown.dart';
import 'package:baridx_orderflow/presentation/widgets/base/animated_gradient_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glass_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../dependency_injection/service_locator.dart';
import '../../layouts/app_layout.dart';

class PackageDetailsScreen extends StatelessWidget {
  const PackageDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PackageDetailsCubit>(),
      child: Builder(
        builder: (context) {
          final _ = context.read<PackageDetailsCubit>();
          return AppLayout(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: .5.w, vertical: 2.h),
                        child: Form(
                          key: _.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Header
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                                padding: EdgeInsets.only(top: 5.h, bottom: 2.h),
                                child: Column(
                                  children: [
                                    Text(
                                      AppStrings.packageDetailsTitle,
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textPrimary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      AppStrings.packageDetailsSubtitle,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.textSecondary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),

                              // Dropdown - Package Type
                              GlassDropdown(
                                label: AppStrings.packageTypeLabel,
                                hintText: AppStrings.packageTypeHint,
                                items: AppStrings.items,
                                selectedValue: _.selectedPackageType,
                                onChanged: _.onDropDownChanged,
                              ),
                              // Input - Weight
                              GlassInput(
                                  label: AppStrings.packageWeightLabel,
                                  hintText: AppStrings.packageWeightHint,
                                  controller: _.weightController,
                                  keyboardType: TextInputType.number,
                                  validator: (val) =>
                                      Validators.validateRequiredField(
                                          val, AppStrings.packageWeightLabel)),

                              // Input - Delivery Notes
                              GlassInput(
                                label: AppStrings.deliveryNotesLabel,
                                hintText: AppStrings.deliveryNotesHint,
                                controller: _.notesController,
                                keyboardType: TextInputType.text,
                              ),
                              const Spacer(),
                              // Animated Button
                              Center(
                                child: AnimatedGradientButton(
                                  text: AppStrings.nextButton,
                                  onPressed: _.nextStep,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/utils/validators.dart';
import 'package:baridx_orderflow/logic/cubits/package_details_cubit.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glass_dropdown.dart';
import 'package:baridx_orderflow/presentation/widgets/base/animated_gradient_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glass_input.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../dependency_injection/service_locator.dart';
import '../../layouts/app_layout.dart';
import '../../widgets/base/custom_header.dart';

class PackageDetailsScreen extends StatelessWidget {
  /// Retrieves the PackageDetailsCubit instance from the service locator.
  final packageDetailCubit = locator<PackageDetailsCubit>();

  PackageDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: .5.w, vertical: 2.h),
                  child: Form(
                    key: packageDetailCubit.formKey, // Associates form validation with Cubit.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Header with title and subtitle.
                        const CustomHeader(
                          title: AppStrings.packageDetailsTitle,
                          subtitle: AppStrings.packageDetailsSubtitle,
                        ),

                        /// Dropdown for selecting package type.
                        GlassDropdown(
                          label: AppStrings.packageTypeLabel,
                          hintText: AppStrings.packageTypeHint,
                          items: AppStrings.items,
                          selectedValue: packageDetailCubit.selectedPackageType,
                          onChanged: packageDetailCubit.onDropDownChanged,
                        ),

                        /// Input field for entering package weight.
                        GlassInput(
                          label: AppStrings.packageWeightLabel,
                          hintText: AppStrings.packageWeightHint,
                          controller: packageDetailCubit.weightController,
                          keyboardType: TextInputType.number,
                          validator: (val) =>
                              Validators.validateRequiredField(
                                  val, AppStrings.packageWeightLabel),
                        ),

                        /// Optional input for delivery notes.
                        GlassInput(
                          label: AppStrings.deliveryNotesLabel,
                          hintText: AppStrings.deliveryNotesHint,
                          controller: packageDetailCubit.notesController,
                          keyboardType: TextInputType.text,
                        ),

                        const Spacer(),

                        /// Button to proceed to the next step.
                        Center(
                          child: AnimatedGradientButton(
                            text: AppStrings.nextButton,
                            onPressed: packageDetailCubit.nextStep,
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
  }
}

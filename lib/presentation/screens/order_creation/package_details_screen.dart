import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/extensions/extensions.dart';
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
import '../../widgets/base/app_header.dart';

class PackageDetailsScreen extends StatelessWidget {
  const PackageDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PackageDetailsCubit>(),
      child: Builder(
        builder: (context) {
          final _ = context.pkgCubit;
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
                              const CustomHeader(
                                title: AppStrings.packageDetailsTitle,
                                subtitle: AppStrings.packageDetailsSubtitle,
                              ),
                              GlassDropdown(
                                label: AppStrings.packageTypeLabel,
                                hintText: AppStrings.packageTypeHint,
                                items: AppStrings.items,
                                selectedValue: _.selectedPackageType,
                                onChanged: _.onDropDownChanged,
                              ),
                              GlassInput(
                                  label: AppStrings.packageWeightLabel,
                                  hintText: AppStrings.packageWeightHint,
                                  controller: _.weightController,
                                  keyboardType: TextInputType.number,
                                  validator: (val) =>
                                      Validators.validateRequiredField(
                                          val, AppStrings.packageWeightLabel)),
                              GlassInput(
                                label: AppStrings.deliveryNotesLabel,
                                hintText: AppStrings.deliveryNotesHint,
                                controller: _.notesController,
                                keyboardType: TextInputType.text,
                              ),
                              const Spacer(),
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
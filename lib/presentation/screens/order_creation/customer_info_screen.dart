import 'package:baridx_orderflow/core/utils/validators.dart';
import 'package:baridx_orderflow/presentation/widgets/base/animated_gradient_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/custom_header.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glass_input.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_strings.dart';
import '../../../dependency_injection/service_locator.dart';
import '../../../logic/cubits/customer_info_cubit.dart';
import '../../layouts/app_layout.dart';

class CustomerInfoScreen extends StatelessWidget {
  CustomerInfoScreen({super.key});
  final customerInfoCubit = locator<CustomerInfoCubit>();

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.minHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CustomHeader(
                          title: AppStrings.infoScreenTitle,
                          subtitle: AppStrings.infoScreenSubTitle),
                      Expanded(
                        child: Form(
                          key: customerInfoCubit.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlassInput(
                                label: AppStrings.firstName,
                                hintText: AppStrings.enterFirstName,
                                controller:
                                    customerInfoCubit.firstNameController,
                                validator: (value) =>
                                    Validators.validateRequiredField(
                                  value,
                                  AppStrings.firstName,
                                ),
                              ),
                              GlassInput(
                                label: AppStrings.secondName,
                                hintText: AppStrings.enterSecondName,
                                controller:
                                    customerInfoCubit.secondNameController,
                                validator: (value) =>
                                    Validators.validateRequiredField(
                                  value,
                                  AppStrings.secondName,
                                ),
                              ),
                              GlassInput(
                                label: AppStrings.address,
                                hintText: AppStrings.enterAddress,
                                controller: customerInfoCubit.addressController,
                                validator: (value) =>
                                    Validators.validateRequiredField(
                                  value,
                                  AppStrings.address,
                                ),
                              ),
                              GlassInput(
                                label: AppStrings.phone,
                                hintText: AppStrings.enterPhone,
                                controller: customerInfoCubit.phoneController,
                                keyboardType: TextInputType.phone,
                                validator: (value) =>
                                    Validators.validatePhoneNumber(value),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 9.h),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: AnimatedGradientButton(
                          text: AppStrings.next,
                          onPressed: customerInfoCubit.nextStep,
                        ),
                      ),
                    ],
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

import 'package:baridx_orderflow/core/utils/validators.dart';
import 'package:baridx_orderflow/presentation/widgets/base/animated_gradient_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/app_header.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glass_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_strings.dart';
import '../../../dependency_injection/service_locator.dart';
import '../../../logic/cubits/customer_info_cubit.dart';
import '../../layouts/app_layout.dart';

class CustomerInfoScreen extends StatelessWidget {
  const CustomerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<CustomerInfoCubit>(),
      child: Builder(
        builder: (context) {
          final _ = context.read<CustomerInfoCubit>();
          return AppLayout(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const CustomHeader(
                                title: AppStrings.infoScreenTitle,
                                subtitle: AppStrings.infoScreenSubTitle),
                            Expanded(
                              child: Form(
                                key: _.formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlassInput(
                                      label: AppStrings.firstName,
                                      hintText: AppStrings.enterFirstName,
                                      controller: _.firstNameController,
                                      validator: (value) =>
                                          Validators.validateRequiredField(
                                        value,
                                        AppStrings.firstName,
                                      ),
                                    ),
                                    GlassInput(
                                      label: AppStrings.secondName,
                                      hintText: AppStrings.enterSecondName,
                                      controller: _.secondNameController,
                                      validator: (value) =>
                                          Validators.validateRequiredField(
                                        value,
                                        AppStrings.secondName,
                                      ),
                                    ),
                                    GlassInput(
                                      label: AppStrings.address,
                                      hintText: AppStrings.enterAddress,
                                      controller: _.addressController,
                                      validator: (value) =>
                                          Validators.validateRequiredField(
                                        value,
                                        AppStrings.address,
                                      ),
                                    ),
                                    GlassInput(
                                      label: AppStrings.phone,
                                      hintText: AppStrings.enterPhone,
                                      controller: _.phoneController,
                                      keyboardType: TextInputType.phone,
                                      validator: (value) =>
                                          Validators.validatePhoneNumber(value),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.h),
                              child: AnimatedGradientButton(
                                text: AppStrings.next,
                                onPressed: _.nextStep,
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
        },
      ),
    );
  }
}

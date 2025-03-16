import 'package:baridx_orderflow/core/utils/validators.dart';
import 'package:baridx_orderflow/presentation/widgets/base/animated_gradient_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glassmorphic_text_field.dart';
import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_colors.dart';
import '../../layouts/app_layout.dart';

class CustomerInfoScreen extends StatefulWidget {
  const CustomerInfoScreen({super.key});

  @override
  State<CustomerInfoScreen> createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    secondNameController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void nextStep() {
    if (_formKey.currentState?.validate() ?? false) {
      AppRouter.goPackageDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints( minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        padding: EdgeInsets.only(top: 5.h, bottom: 2.h),
                        child: Column(
                          children: [
                            Text(
                              AppStrings.infoScreenTitle,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              AppStrings.infoScreenSubTitle,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlassInput(
                                label: AppStrings.firstName,
                                hintText: AppStrings.enterFirstName,
                                controller: firstNameController,
                                validator: (value) =>
                                    Validators.validateRequiredField(
                                      value,
                                      AppStrings.firstName,
                                    ),
                              ),
                              GlassInput(
                                label: AppStrings.secondName,
                                hintText: AppStrings.enterSecondName,
                                controller: secondNameController,
                                validator: (value) =>
                                    Validators.validateRequiredField(
                                      value,
                                      AppStrings.secondName,
                                    ),
                              ),
                              GlassInput(
                                label: AppStrings.address,
                                hintText: AppStrings.enterAddress,
                                controller: addressController,
                                validator: (value) =>
                                    Validators.validateRequiredField(
                                      value,
                                      AppStrings.address,
                                    ),
                              ),
                              GlassInput(
                                label: AppStrings.phone,
                                hintText: AppStrings.enterPhone,
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                validator: (value) =>
                                    Validators.validatePhoneNumber(value),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // 🎵 "Next" Button with Animation
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: AnimatedGradientButton(
                          text: AppStrings.next,
                          onPressed: nextStep,
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

import 'package:baridx_orderflow/core/utils/validators.dart';
import 'package:baridx_orderflow/presentation/widgets/base/animated_gradient_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glassmorphic_text_field.dart';
import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/constants/app_strings.dart';
import '../../layouts/app_layout.dart';

class CustomerInfoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  CustomerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void nextStep() {
      if (_formKey.currentState?.validate() ?? false) {
        AppRouter.goPackageDetails();
      }
    }

    return AppLayout(
      title: AppStrings.enterCustomerDetails,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              AppStrings.enterCustomerDetails,
              style: AppStyles.titleStyle,
            ),
            Text(
              AppStrings.splashSubtitle,
              style: AppStyles.subtitleStyle,
            ),
            SizedBox(height: 3.h),

            // First Name
            GlassmorphicTextField(
              label: "First Name",
              hintText: "Enter your first name",
              controller: firstNameController,
              validator: (value) => Validators.validateRequiredField(
                value,
                AppStrings.firstName,
              ),
            ),

            // Second Name
            GlassmorphicTextField(
              label: "Second Name",
              hintText: "Enter your second name",
              controller: secondNameController,
              validator: (value) => Validators.validateRequiredField(
                value,
                AppStrings.secondName,
              ),
            ),

            // Address
            GlassmorphicTextField(
              label: "Address",
              hintText: "Enter your address",
              controller: addressController,
              validator: (value) => Validators.validateRequiredField(
                value,
                AppStrings.address,
              ),
            ),

            // Phone Number
            GlassmorphicTextField(
              label: "Phone Number",
              hintText: "Enter your phone number",
              controller: phoneController,
              keyboardType: TextInputType.phone,
              validator: (value) => Validators.validatePhoneNumber(value),
            ),

            SizedBox(height: 3.h),
            AnimatedGradientButton(
              text: "Next",
              onPressed: nextStep,
            ),
          ],
        ),
      ),
    );
  }
}

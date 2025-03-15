import 'dart:ui';
import 'package:baridx_orderflow/presentation/widgets/base/animated_gradient_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glassmorphic_text_field.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_styles.dart';
import '../../../core/constants/app_strings.dart';

class CustomerInfoScreen extends StatefulWidget {
  const CustomerInfoScreen({super.key});

  @override
  _CustomerInfoScreenState createState() => _CustomerInfoScreenState();
}

class _CustomerInfoScreenState extends State<CustomerInfoScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      GoRouter.of(context).push('/package-details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.gradientStart,
                  AppColors.gradientMid,
                  AppColors.gradientEnd,
                ],
              ),
            ),
          ),

          // Blurred Light Effects
          Positioned(
            top: 30.h,
            left: 25.w,
            child: BlurredCircle(color: AppColors.blurSoftPurple, size: 35.w),
          ),
          Positioned(
            bottom: -5.h,
            right: -10.w,
            child: BlurredCircle(color: AppColors.blurSoftPurple, size: 40.w),
          ),

          // Customer Info Form
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppDimensions.paddingLarge),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      AppStrings.enterCustomerDetails,
                      style: AppStyles.titleStyle,
                    ),
                    Text(
                      AppStrings.splashSubtitle,
                      style: AppStyles.subtitleStyle,
                    ),
                    SizedBox(height: 3.h),
                    GlassmorphicTextField(
                      label: "First Name",
                      hintText: "Enter your first name",
                      controller: firstNameController,
                      validator: (value) =>
                          value!.isEmpty ? "First name is required" : null,
                    ),

                    // Second Name
                    GlassmorphicTextField(
                      label: "Second Name",
                      hintText: "Enter your second name",
                      controller: secondNameController,
                      validator: (value) =>
                          value!.isEmpty ? "Second name is required" : null,
                    ),

                    // Address
                    GlassmorphicTextField(
                      label: "Address",
                      hintText: "Enter your address",
                      controller: addressController,
                      validator: (value) =>
                          value!.isEmpty ? "Address is required" : null,
                    ),
                    GlassmorphicTextField(
                      label: "Phone Number",
                      hintText: "Enter your phone number",
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          value!.length < 10 ? "Invalid phone number" : null,
                    ),

                    SizedBox(height: 3.h),
                    AnimatedGradientButton(text: "Next", onPressed: _nextStep),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Blurred Circle for Light Effects
class BlurredCircle extends StatelessWidget {
  final Color color;
  final double size;

  const BlurredCircle({required this.color, required this.size, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

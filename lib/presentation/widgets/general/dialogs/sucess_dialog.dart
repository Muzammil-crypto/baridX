import 'package:baridx_orderflow/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../base/animated_gradient_button.dart';
import '../../base/custom_header.dart';

class SuccessDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const SuccessDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 10,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 6.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: AppColors.success,
              size: AppDimensions.iconLarge,
            ),
            const CustomHeader(
              title: AppStrings.orderSuccessTitle,
              subtitle: AppStrings.orderSuccessMessage,
            ),
            SizedBox(height: 3.h),
            Center(
              child: SizedBox(
                width: AppDimensions.buttonWidth,
                child: AnimatedGradientButton(
                  text: AppStrings.ok,
                  onPressed: onConfirm,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

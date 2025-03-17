import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class OrderProcessingDialog extends StatelessWidget {
  const OrderProcessingDialog({super.key});

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
            SizedBox(
              width: 12.w,
              height: 12.w,
              child: const CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 4,
              ),
            ),
            SizedBox(height: 3.h),
            Text(
              AppStrings.processingOrder,
              style: AppStyles.labelTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

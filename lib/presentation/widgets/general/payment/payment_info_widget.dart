import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../base/custom_header.dart';

class PaymentInfoWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Widget? inputField; // Optional input field for payment details

  const PaymentInfoWidget({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.inputField,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: .5.w, vertical: 2.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Payment method icon
            Icon(
              icon,
              size: 10.h,
              color: AppColors.primary.withOpacity(0.8),
            ),

            SizedBox(height: 2.h),

            /// Title and description
            CustomHeader(title: title, subtitle: description),

            SizedBox(height: 2.h),

            /// Displays an input field if applicable (e.g., card number or phone number)
            if (inputField != null)
              Padding(
                padding: EdgeInsets.only(top: 1.5.h),
                child: inputField!,
              ),
          ],
        ),
      ),
    );
  }
}

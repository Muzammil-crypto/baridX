import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class AnimatedDot extends StatelessWidget {
  final bool isActive;
  const AnimatedDot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 1.w),
      width: isActive ? 3.w : 2.w,
      height: isActive ? 3.w : 2.w,
      decoration: BoxDecoration(
        color: isActive ? AppColors.activeDot : AppColors.inactiveDot,
        shape: BoxShape.circle,
      ),
    );
  }
}

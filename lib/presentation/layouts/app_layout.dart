import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/general/custom_appbar.dart';

class AppLayout extends StatelessWidget {
  final bool isAppBar;
  final String title;
  final Widget child;
  final bool showBackButton;
  final List<Widget>? actions;

  const AppLayout({
    super.key,
    this.isAppBar = true,
    required this.title,
    required this.child,
    this.showBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      isAppBar ?
      CustomAppBar(
        title: title,
        showBackButton: showBackButton,
        actions: actions,
      ) : null,
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.appGradient,
            ),
          ),
          // Blurred Light Effects
          Positioned(
            top: 30.h,
            left: 28.w,
            child: BlurredCircle(color: AppColors.blurSoftPurple, size: 50.w),
          ),
          Positioned(
            bottom: -2.h,
            left: -5.w,
            child: BlurredCircle(color: AppColors.blurSoftPurple, size: 30.w),
          ),

          // Main Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            child: child,
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

  const BlurredCircle({required this.color, required this.size, super.key});

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
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

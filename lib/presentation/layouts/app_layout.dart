import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/general/layout/layout_circles.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final bool showBackButton;
  final List<Widget>? actions;

  const AppLayout({
    super.key,
    this.showBackButton = true,
    required this.child,
    this.actions,
  });

  /// Alternative constructor for screens where the back button is not needed.
  const AppLayout.noBackButton({
    super.key,
    required this.child,
    this.actions,
  }) : showBackButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: AppColors.appGradient,
            ),
          ),

          // Blurred Light Effects for UI Aesthetic
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

          // Back Button (only shown when enabled)
          if (showBackButton)
            Positioned(
              top: 8.h,
              left: 6.w,
              child: GestureDetector(
                onTap: AppRouter.goBack,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.textPrimary,
                ),
              ),
            ),

          // Child will be the main content of the screen, the wrapped widget
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
            child: child,
          ),
        ],
      ),
    );
  }
}

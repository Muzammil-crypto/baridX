import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/general/layout_circles.dart';

class AppLayout extends StatelessWidget {
  final bool isAppBar;
  final Widget child;
  final bool showBackButton;
  final List<Widget>? actions;

  const AppLayout({
    super.key,
    this.isAppBar = true,
    required this.child,
    this.showBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
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
          if (showBackButton)
            Positioned(
              top: 6.h,
              left: 6.w,
              child: GestureDetector(
                onTap: AppRouter.goBack,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          // Main Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
            child: child,
          ),
        ],
      ),
    );
  }
}

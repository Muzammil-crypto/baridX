import 'dart:ui';
import 'package:baridx_orderflow/core/constants/app_asssets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_styles.dart';
import '../../core/constants/app_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _onPressed(BuildContext context) {
    GoRouter.of(context).push('/customer-info');
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

          Positioned(
            top: 40.h,
            left: 35.w,
            child: BlurredCircle(color: AppColors.blurSoftPurple, size: 25.w),
          ),
          Positioned(
            bottom: -2.h,
            left: -5.w,
            child: BlurredCircle(color: AppColors.blurSoftPurple, size: 30.w),
          ),

          Positioned(
            top: 6.h, // Responsive positioning
            right: 5.w,
            child: TextButton(
              onPressed: () => _onPressed(context),
              child: Text(
                AppStrings.skip,
                style: AppStyles.buttonTextStyle
                    .copyWith(color: AppColors.textPrimary),
              ),
            ),
          ),

          // Main Content
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(),

              // Headphone Image (Responsive)
              Center(
                child: Image.asset(
                  AppAssets.headphones,
                  width: 40.w, // Responsive width
                ),
              ),

              const Spacer(),

              // Title with Branding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                      style: AppStyles.titleStyle,
                      children: [
                        TextSpan(text: AppStrings.appName),
                        TextSpan(
                          text: ".", // Dot in primary color
                          style: AppStyles.titleStyle
                              .copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Subtitle
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
                child:  Text(
                  AppStrings.splashSubtitle,
                  textAlign: TextAlign.left,
                  style: AppStyles.subtitleStyle,
                ),
              ),

              // Dots Indicator
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                child: const SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AnimatedDot(isActive: false),
                      AnimatedDot(isActive: true),
                      AnimatedDot(isActive: false),
                    ],
                  ),
                ),
              ),

              // Bottom Spacing
              SizedBox(height: 5.h),
            ],
          ),
        ],
      ),
    );
  }
}

// Animated Dot Widget
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
        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}

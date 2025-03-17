import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:baridx_orderflow/logic/cubits/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SplashSlide extends StatelessWidget {
  final int index;
  const SplashSlide({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final splashCubit = context.read<SplashCubit>();

    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: SlideTransition(
              position: splashCubit.slideAnimation,
              child: FadeTransition(
                opacity: splashCubit.fadeAnimation,
                child: Image.asset(
                  AppStrings.splashData[index]["image"]!,
                  width: 50.w,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlideTransition(
                  position: splashCubit.slideAnimation,
                  child: FadeTransition(
                    opacity: splashCubit.fadeAnimation,
                    child: RichText(
                      text: TextSpan(
                        style: AppStyles.titleStyle,
                        children: [
                          TextSpan(text: AppStrings.splashData[index]["title"]),
                          TextSpan(
                            text: ".",
                            style: AppStyles.titleStyle
                                .copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SlideTransition(
                  position: splashCubit.slideAnimation,
                  child: FadeTransition(
                    opacity: splashCubit.fadeAnimation,
                    child: Text(
                      AppStrings.splashSubtitle,
                      textAlign: TextAlign.left,
                      style: AppStyles.subtitleStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

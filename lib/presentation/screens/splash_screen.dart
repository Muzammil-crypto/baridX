import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:baridx_orderflow/presentation/widgets/general/splash/dot_indicators.dart';
import 'package:baridx_orderflow/presentation/widgets/general/splash/splash_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_colors.dart';
import '../../logic/cubits/splash_cubit.dart';
import '../widgets/general/layout_circles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late SplashCubit splashCubit;


  @override
  void initState() {
    super.initState();
    splashCubit = SplashCubit(vsync: this);
  }

  @override
  void dispose() {
    splashCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: splashCubit,
      child: Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                // Background Gradient
                Container(
                  decoration: const BoxDecoration(
                    gradient: AppColors.appGradient,
                  ),
                ),

                // Blurred Circles
                Positioned(
                  top: constraints.maxHeight * 0.25,
                  left: constraints.maxWidth * 0.25,
                  child: BlurredCircle(
                      color: AppColors.blurSoftPurple,
                      size: constraints.maxWidth * 0.6),
                ),
                Positioned(
                  bottom: -constraints.maxHeight * 0.02,
                  left: -constraints.maxWidth * 0.05,
                  child: BlurredCircle(
                      color: AppColors.blurSoftPurple,
                      size: constraints.maxWidth * 0.4),
                ),

                // PageView with Animated Dots
                Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: BlocBuilder<SplashCubit, int>(
                        builder: (context, pageIndex) {
                          return PageView.builder(
                            onPageChanged: (index) {
                              splashCubit.updatePage(index);
                            },
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return SplashSlide(index: index);
                            },
                          );
                        },
                      ),
                    ),

                    // Dots Indicators
                    BlocBuilder<SplashCubit, int>(
                      builder: (context, pageIndex) {
                        return Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              3,
                              (index) =>
                                  AnimatedDot(isActive: index == pageIndex),
                            ),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
                // Skip Button
                Positioned(
                  top: constraints.maxHeight * 0.06,
                  right: constraints.maxWidth * 0.05,
                  child: TextButton(
                    onPressed: splashCubit.onPressed,
                    child: Text(
                      AppStrings.skip,
                      style: AppStyles.buttonTextStyle,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

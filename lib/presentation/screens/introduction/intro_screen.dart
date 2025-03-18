import 'package:baridx_orderflow/core/constants/app_asssets.dart';
import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:baridx_orderflow/logic/cubits/intro_cubit.dart';
import 'package:baridx_orderflow/dependency_injection/service_locator.dart';
import 'package:baridx_orderflow/presentation/layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

/// The introduction for limited time screen, The first screen that users see when they open the app.
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late IntroCubit introCubit;

  @override
  void initState() {
    super.initState();
    // Retrieve the IntroCubit instance from GetIt and pass necessary parameters.
    // The TickerProvider is required for animations.
    introCubit = locator<IntroCubit>(param1: context, param2: this);
  }

  @override
  void dispose() {
    // Close the Cubit to free up resources when the screen is removed.
    introCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: introCubit,
      child: AppLayout(
        showBackButton: false, // Intro screen does not need a back button.
        child: Column(
          children: [
            Expanded(flex: 5, child: Container()),

            // Animated Speaker Image
            Expanded(
              flex: 6,
              child: Center(
                child: SlideTransition(
                  position: introCubit.slideAnimation, // Slide animation
                  child: FadeTransition(
                    opacity: introCubit.fadeAnimation, // Fade animation
                    child: Image.asset(
                      AppAssets.speaker,
                      width: 40.w, // Responsive width using Sizer.
                    ),
                  ),
                ),
              ),
            ),

            // App Name with Styled Dot
            Expanded(
              flex: 2,
              child: Center(
                child: FadeTransition(
                  opacity: introCubit.fadeAnimation,
                  child: RichText(
                    text: TextSpan(
                      style: AppStyles.titleStyle,
                      children: [
                        const TextSpan(text: AppStrings.appName),
                        TextSpan(
                          text: ".",
                          style: AppStyles.titleStyle
                              .copyWith(color: AppColors.primary), // Primary color dot.
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Expanded(flex: 5, child: Container()),
          ],
        ),
      ),
    );
  }
}

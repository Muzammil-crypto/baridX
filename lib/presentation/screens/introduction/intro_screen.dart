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
    // Get Cubit from service locator (pass context & TickerProvider)
    introCubit = locator<IntroCubit>(param1: context, param2: this);
  }

  @override
  void dispose() {
    introCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: introCubit,
      child: AppLayout(
        child: Column(
          children: [
            Expanded(flex: 5, child: Container()),
            Expanded(
              flex: 6,
              child: Center(
                child: SlideTransition(
                  position: introCubit.slideAnimation,
                  child: FadeTransition(
                    opacity: introCubit.fadeAnimation,
                    child: Image.asset(
                      AppAssets.speaker,
                      width: 40.w,
                    ),
                  ),
                ),
              ),
            ),
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
                              .copyWith(color: AppColors.primary),
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

import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:baridx_orderflow/presentation/layouts/app_layout.dart';
import 'package:baridx_orderflow/presentation/widgets/general/splash/dot_indicators.dart';
import 'package:baridx_orderflow/presentation/widgets/general/splash/splash_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/splash_cubit.dart';

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
      child: AppLayout.noBackButton(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
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
                  top: 0,
                  right: 0,
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

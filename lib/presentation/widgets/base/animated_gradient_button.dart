import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_dimensions.dart';
import 'package:baridx_orderflow/logic/cubits/button_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimatedGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AnimatedGradientButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AnimatedButtonCubit(),
      child: BlocBuilder<AnimatedButtonCubit, bool>(
        builder: (context, isAnimating) {
          return GestureDetector(
            onTap: () {
              context.read<AnimatedButtonCubit>().animate();
              onPressed();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              height: 50,
              width: AppDimensions.buttonWidth,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: isAnimating ? 15 : 10,
                    spreadRadius: isAnimating ? 3 : 2,
                  ),
                ],
                border: Border.all(
                  color: isAnimating ? AppColors.gradientStart: Colors.transparent,
                  width: isAnimating ? 2.5 : 0,
                ),
              ),
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: isAnimating ? 0.7 : 1.0,
                  child: Text(
                    text,
                    style:  TextStyle(color: AppColors.gradientStart, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

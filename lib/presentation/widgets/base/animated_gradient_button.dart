import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class AnimatedGradientButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  /// AnimatedGradientButton is a custom button widget with a gradient design and beautiful animation.
  const AnimatedGradientButton({super.key, required this.text, required this.onPressed});

  @override
  _AnimatedGradientButtonState createState() => _AnimatedGradientButtonState();
}

class _AnimatedGradientButtonState extends State<AnimatedGradientButton> {
  bool isAnimating = false;

  /// Triggers the button animation on press.
  void _animate() {
    setState(() => isAnimating = true);
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) setState(() => isAnimating = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animate();
        widget.onPressed();
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
            color: isAnimating ? AppColors.gradientStart : Colors.transparent,
            width: isAnimating ? 2.5 : 0,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 400),
            opacity: isAnimating ? 0.7 : 1.0,
            child: Text(
              widget.text,
              style: const TextStyle(
                color: AppColors.gradientStart,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

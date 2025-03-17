import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_styles.dart';

class CustomHeader extends StatefulWidget {
  final String title;
  final String subtitle;

  const CustomHeader({super.key, required this.title, required this.subtitle});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  bool isAnimated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          isAnimated = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      padding: EdgeInsets.only(top: isAnimated ? 5.h : 3.h, bottom: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: isAnimated ? 1.0 : 0.0,
              child: Text(
                widget.title,
                style: AppStyles.headerTitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: isAnimated ? 1.0 : 0.0,
              child: Text(
                widget.subtitle,
                style: AppStyles.headerSubtitleStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

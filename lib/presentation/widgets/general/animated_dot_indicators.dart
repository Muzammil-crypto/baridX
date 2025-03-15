import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedDots extends StatefulWidget {
  final int currentIndex;
  const AnimatedDots({Key? key, required this.currentIndex}) : super(key: key);

  @override
  _AnimatedDotsState createState() => _AnimatedDotsState();
}

class _AnimatedDotsState extends State<AnimatedDots> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: widget.currentIndex == index ? 12 : 8,
          height: widget.currentIndex == index ? 12 : 8,
          decoration: BoxDecoration(
            color: widget.currentIndex == index ? AppColors.activeDot : AppColors.inactiveDot,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}

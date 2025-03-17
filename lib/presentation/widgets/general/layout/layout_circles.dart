import 'dart:ui';
import 'package:flutter/material.dart';

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
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
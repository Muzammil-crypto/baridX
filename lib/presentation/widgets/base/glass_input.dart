import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_dimensions.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:baridx_orderflow/logic/cubits/glass_input_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class GlassInput extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;
/// GlassInput is a custom input field widget with a glassmorphism design.
  const GlassInput({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  });

  @override
  _GlassInputState createState() => _GlassInputState();
}

class _GlassInputState extends State<GlassInput>
    with SingleTickerProviderStateMixin {
  late TextFieldCubit textFieldCubit;

  @override
  void initState() {
    super.initState();
    // Initializes the Cubit with an animation controller for validation feedback.
    textFieldCubit = TextFieldCubit(
      controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 400)),
    );
  }

  @override
  void dispose() {
    // Ensures proper cleanup of Cubit and animation controller.
    textFieldCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: textFieldCubit,
      child: Builder(builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Input Label
              Text(widget.label, style: AppStyles.labelTextStyle),
              SizedBox(height: 0.5.h),

              // Animated Text Field with Validation Feedback
              AnimatedBuilder(
                animation: textFieldCubit.shakeAnimation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(textFieldCubit.shakeAnimation.value, 0),
                    child: child,
                  );
                },
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  obscureText: widget.obscureText,
                  style: AppStyles.inputTextStyle,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: AppStyles.inputHintStyle,
                    filled: true,
                    fillColor: AppColors.primary.withOpacity(0.05),

                    // Default Border
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: BorderSide(
                        color: AppColors.primary.withOpacity(0.3),
                      ),
                    ),

                    // Border when input is enabled
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: BorderSide(
                        color: AppColors.primary.withOpacity(0.3),
                      ),
                    ),

                    // Border when input is focused
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 0.5,
                      ),
                    ),

                    // Border when validation fails
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                        width: 0.5,
                      ),
                    ),

                    // Border when validation fails but the field is focused
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                        width: 0.5,
                      ),
                    ),

                    // Input padding for better spacing
                    contentPadding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                  ),

                  // Validator function with animation trigger on failure
                  validator: (value) {
                    final result = widget.validator?.call(value);
                    if (result != null) {
                      textFieldCubit.shake(); // Triggers shake animation on validation error.
                    }
                    return result;
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

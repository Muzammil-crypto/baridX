import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_dimensions.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:baridx_orderflow/logic/cubits/textfield_cubit.dart';
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

  const GlassInput({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  _GlassInputState createState() => _GlassInputState();
}

class _GlassInputState extends State<GlassInput>
    with SingleTickerProviderStateMixin {
  late TextFieldCubit textFieldCubit;

  @override
  void initState() {
    super.initState();
    textFieldCubit = TextFieldCubit(
      controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 400)),
    );
  }

  @override
  void dispose() {
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
              Text(widget.label, style: const TextStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 0.5.h),
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
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: BorderSide(
                        color: AppColors.primary.withOpacity(0.3),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: BorderSide(
                        color: AppColors.primary.withOpacity(0.3),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: const BorderSide(
                        color: AppColors.primary,
                        width: 0.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                        width: 0.5,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(AppDimensions.borderRadiusMedium),
                      borderSide: const BorderSide(
                        color: AppColors.error,
                        width: 0.5,
                      ),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.5.h),
                  ),
                  validator: (value) {
                    final result = widget.validator?.call(value);
                    if (result != null) {
                      textFieldCubit.shake(); // Trigger shake animation if invalid
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

import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_dimensions.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GlassmorphicTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText;

  GlassmorphicTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding:  EdgeInsets.symmetric(vertical: .5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: .5.h),
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.01),
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusMedium),
              border: Border.all(
                color: AppColors.primary.withOpacity(0.3),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: TextFormField(
              cursorColor: AppColors.primary,
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              style: AppStyles.inputTextStyle,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppStyles.inputHintStyle,
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(3.w),
              ),
            ),
          ),
          validator != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: .3.h,),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      textAlign: TextAlign.left,
                      validator!(controller.text) ?? '',
                      style: AppStyles.errorTextStyle,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

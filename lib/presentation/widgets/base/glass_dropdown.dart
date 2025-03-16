import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_dimensions.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:baridx_orderflow/core/utils/validators.dart';
import 'package:baridx_orderflow/logic/cubits/textfield_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class GlassDropdown extends StatefulWidget {
  final String label;
  final String hintText;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const GlassDropdown({
    Key? key,
    required this.label,
    required this.hintText,
    required this.items,
    this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _GlassDropdownState createState() => _GlassDropdownState();
}

class _GlassDropdownState extends State<GlassDropdown>
    with SingleTickerProviderStateMixin {
  late TextFieldCubit dropdownCubit;

  @override
  void initState() {
    super.initState();
    dropdownCubit = TextFieldCubit(
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400)),
    );
  }

  @override
  void dispose() {
    dropdownCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: dropdownCubit,
      child: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.label,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 0.5.h),
                AnimatedBuilder(
                  animation: dropdownCubit.shakeAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(dropdownCubit.shakeAnimation.value, 0),
                      child: child,
                    );
                  },
                  child: DropdownButtonFormField<String>(
                    value: widget.selectedValue,
                    hint:
                        Text(widget.hintText, style: AppStyles.inputHintStyle),
                    items: widget.items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item, style: AppStyles.inputTextStyle),
                      );
                    }).toList(),
                    onChanged: widget.onChanged,
                    validator: (val) =>
                        Validators.validateDropdownField(val, widget.label),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.primary
                          .withOpacity(0.05), // Matches GlassInput
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.borderRadiusMedium),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.borderRadiusMedium),
                        borderSide: BorderSide(
                          color: AppColors.primary.withOpacity(0.3),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.borderRadiusMedium),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                          width: 0.5,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.borderRadiusMedium),
                        borderSide: const BorderSide(
                          color: AppColors.error,
                          width: 0.5,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            AppDimensions.borderRadiusMedium),
                        borderSide: const BorderSide(
                          color: AppColors.error,
                          width: 0.5,
                        ),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 3.w, vertical: 1.5.h),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

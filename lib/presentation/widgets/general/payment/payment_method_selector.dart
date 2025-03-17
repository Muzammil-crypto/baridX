import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_enums.dart';

class PaymentMethodSelector extends StatelessWidget {
  final PaymentMethod selectedMethod;
  final ValueChanged<PaymentMethod> onSelect;

  const PaymentMethodSelector({
    super.key,
    required this.selectedMethod,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final methods = {
      PaymentMethod.goBack: AppStrings.goBack,
      PaymentMethod.creditCard: AppStrings.creditCard,
      PaymentMethod.cashOnDelivery: AppStrings.onDeliveryTitle,
      PaymentMethod.payLater: AppStrings.payLater,
    };

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: methods.entries.map((entry) {
          final isSelected = selectedMethod == entry.key;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (entry.key != PaymentMethod.goBack) {
                  onSelect(entry.key);
                } else {
                  AppRouter.goBack();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.backgroundLight
                          : AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

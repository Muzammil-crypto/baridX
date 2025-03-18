import 'package:baridx_orderflow/app.dart';
import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_enums.dart';

class PaymentMethodSelector extends StatelessWidget {
  final PaymentMethod selectedMethod;
  final ValueChanged<PaymentMethod> onSelect;
  ///  displays a list of payment methods and allows users to select one
  const PaymentMethodSelector({
    super.key,
    required this.selectedMethod,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    /// Available payment methods with their respective labels
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
                  onSelect(entry.key); // Updates selected method
                } else {
                  AppRouter.goBack(); // Navigates back if "Go Back" is selected
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
                    style: AppStyles.paymentMethodTextStyle(isSelected).copyWith(fontSize: 13.sp, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500),
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

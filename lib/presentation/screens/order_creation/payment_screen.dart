import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/utils/validators.dart';
import 'package:baridx_orderflow/presentation/widgets/base/animated_gradient_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glass_input.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_enums.dart';
import '../../../dependency_injection/service_locator.dart';
import '../../layouts/app_layout.dart';
import '../../widgets/general/payment/payment_info_widget.dart';
import '../../widgets/general/payment/payment_method_selector.dart';
import '../../../logic/cubits/payment_cubit.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final payCubit = locator<PaymentCubit>(); // Access PaymentCubit globally

    return AppLayout.noBackButton(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    /// Payment method selection with dynamic updates
                    ValueListenableBuilder<PaymentMethod>(
                      valueListenable: payCubit.selectedMethod,
                      builder: (context, method, _) {
                        return PaymentMethodSelector(
                          selectedMethod: method,
                          onSelect: (method) => payCubit.selectPaymentMethod(method),
                        );
                      },
                    ),

                    /// Displays input fields based on selected payment method
                    Expanded(
                      child: ValueListenableBuilder<PaymentMethod>(
                        valueListenable: payCubit.selectedMethod,
                        builder: (context, method, _) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(opacity: animation, child: child);
                            },
                            child: _buildPaymentUI(method, payCubit),
                          );
                        },
                      ),
                    ),

                    /// Proceed Button
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Align(
                        alignment: Alignment.center,
                        child: AnimatedGradientButton(
                          text: AppStrings.next,
                          onPressed: payCubit.handleOnPressed, // Validates and moves to the next step
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Builds UI dynamically based on selected payment method
  Widget _buildPaymentUI(PaymentMethod method, PaymentCubit payCubit) {
    switch (method) {
      case PaymentMethod.creditCard:
        return PaymentInfoWidget(
          title: AppStrings.creditCardTitle,
          description: AppStrings.creditCardDescription,
          icon: Icons.credit_card,
          inputField: Form(
            key: payCubit.payViaCardKey,
            child: GlassInput(
              label: AppStrings.cardNumber,
              hintText: AppStrings.enterCardNumber,
              controller: payCubit.cardNumberController,
              validator: Validators.validateCreditCard,
            ),
          ),
        );

      case PaymentMethod.cashOnDelivery:
        return const PaymentInfoWidget(
          title: AppStrings.greetingCOD,
          description: AppStrings.cashOnDeliveryNote,
          icon: Icons.shopping_bag,
        );

      case PaymentMethod.payLater:
        return PaymentInfoWidget(
          title: AppStrings.enterPhoneForPayLater,
          description: AppStrings.creditCardDescription,
          icon: Icons.phone_android,
          inputField: Form(
            key: payCubit.payLaterKey,
            child: GlassInput(
              label: AppStrings.phone,
              hintText: AppStrings.enterPhone,
              controller: payCubit.phoneNumberController,
              keyboardType: TextInputType.phone,
              validator: Validators.validatePhoneNumber,
            ),
          ),
        );

      case PaymentMethod.goBack:
        return const Text("Red"); // Placeholder for go-back functionality
    }
  }
}

import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:baridx_orderflow/core/extensions/extensions.dart';
import 'package:baridx_orderflow/core/utils/validators.dart';
import 'package:baridx_orderflow/presentation/widgets/base/custom_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/glass_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_enums.dart';
import '../../../logic/cubits/payment_cubit.dart';
import '../../layouts/app_layout.dart';
import '../../widgets/general/payment/payment_info_widget.dart';
import '../../widgets/general/payment/payment_method_selector.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Builder(builder: (context) {
        return AppLayout(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        BlocBuilder<PaymentCubit, PaymentState>(
                          builder: (context, state) {
                            return PaymentMethodSelector(
                              selectedMethod: state.selectedMethod,
                              onSelect: (method) => context
                                  .read<PaymentCubit>()
                                  .selectPaymentMethod(method),
                            );
                          },
                        ),
                        Expanded(
                          child: BlocBuilder<PaymentCubit, PaymentState>(
                            builder: (context, state) {
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                transitionBuilder: (child, animation) {
                                  return FadeTransition(
                                      opacity: animation, child: child);
                                },
                                child: _buildPaymentUI(state, context),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              text: AppStrings.next,
                              onPressed: context.payCubit.handleOnPressed,
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
      }),
    );
  }

  // 🎨 Dynamic UI Based on Selected Payment Method
  Widget _buildPaymentUI(PaymentState state, BuildContext context) {
    final payCubit = context.payCubit;
    switch (state.selectedMethod) {
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
    }
  }
}

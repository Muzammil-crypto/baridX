import 'package:baridx_orderflow/dependency_injection/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:sizer/sizer.dart';
import '../../layouts/app_layout.dart';
import '../../widgets/base/animated_gradient_button.dart';
import '../../widgets/base/custom_header.dart';
import '../../widgets/general/order_creation/order_details_section.dart';
import '../../../logic/cubits/order_cubit.dart';

class ReviewSubmitScreen extends StatelessWidget {
  /// Retrieves OrderCubit instance from the service locator.
  final orderCubit = locator<OrderCubit>();

  ReviewSubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: Column(
        children: [
          /// Page Header with title and subtitle.
          const CustomHeader(
            title: AppStrings.reviewOrder,
            subtitle: AppStrings.reviewOrderSubtitle,
          ),

          /// Displays order details dynamically.
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Section for customer details.
                  OrderDetailSection(
                    title: AppStrings.customerDetails,
                    details: orderCubit.getCustomerDetails(),
                  ),

                  /// Section for package details.
                  OrderDetailSection(
                    title: AppStrings.packageDetails,
                    details: orderCubit.getPackageDetails(),
                  ),

                  /// Section for payment method details.
                  OrderDetailSection(
                    title: AppStrings.selectedPaymentMethod,
                    details: orderCubit.getPaymentDetails(),
                  ),
                ],
              ),
            ),
          ),

          /// Submit Order Button.
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: AnimatedGradientButton(
              text: AppStrings.submitOrder,
              onPressed: orderCubit.handleSubmitOrder, // Triggers order submission.
            ),
          ),
        ],
      ),
    );
  }
}

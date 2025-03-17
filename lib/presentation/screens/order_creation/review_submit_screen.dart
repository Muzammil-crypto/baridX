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
  final orderCubit = locator<OrderCubit>();

  ReviewSubmitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: Column(
        children: [
          const CustomHeader(
            title: AppStrings.reviewOrder,
            subtitle: AppStrings.reviewOrderSubtitle,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderDetailSection(
                    title: AppStrings.customerDetails,
                    details: orderCubit.getCustomerDetails(),
                  ),
                  OrderDetailSection(
                    title: AppStrings.packageDetails,
                    details: orderCubit.getPackageDetails(),
                  ),
                  OrderDetailSection(
                    title: AppStrings.selectedPaymentMethod,
                    details: orderCubit.getPaymentDetails(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h),
            child: AnimatedGradientButton(
              text: AppStrings.submitOrder,
              onPressed: orderCubit.handleSubmitOrder,
            ),
          ),
        ],
      ),
    );
  }
}

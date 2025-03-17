import 'package:baridx_orderflow/dependency_injection/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_strings.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_enums.dart';
import '../../../logic/cubits/customer_info_cubit.dart';
import '../../../logic/cubits/package_details_cubit.dart';
import '../../../logic/cubits/payment_cubit.dart';
import '../../layouts/app_layout.dart';
import '../../widgets/base/animated_gradient_button.dart';
import '../../widgets/base/app_header.dart';
import '../../../routes/app_router.dart';

class ReviewSubmitScreen extends StatelessWidget {
  const ReviewSubmitScreen({super.key});

  void _submitOrder(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const OrderProcessingDialog(),
    );

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => SuccessDialog(
          onConfirm: (){
            AppRouter.replaceToHome();
          }
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final customerCubit = locator<CustomerInfoCubit>();
    final packageCubit = locator<PackageDetailsCubit>();
    final paymentCubit = locator<PaymentCubit>();

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
                    details: [
                      "${AppStrings.name}: ${customerCubit.firstNameController.text} ${customerCubit.secondNameController.text}",
                      "${AppStrings.phone}: ${customerCubit.phoneController.text}",
                      "${AppStrings.address}: ${customerCubit.addressController.text}",
                    ],
                  ),
                  OrderDetailSection(
                    title: AppStrings.packageDetails,
                    details: [
                      "${AppStrings.packageType}: ${packageCubit.selectedPackageType ?? 'N/A'}",
                      "${AppStrings.weight}: ${packageCubit.weightController.text} kg",
                      if (packageCubit.notesController.text.isNotEmpty)
                        "${AppStrings.deliveryNotes}: ${packageCubit.notesController.text}",
                    ],
                  ),
                  OrderDetailSection(
                    title: AppStrings.paymentMethod,
                    details: [
                      "${AppStrings.selectedPaymentMethod}: ${paymentCubit.state.name}",
                      if (paymentCubit.state == PaymentMethod.creditCard)
                        "${AppStrings.cardNumber}: ${paymentCubit.cardNumberController.text}",
                      if (paymentCubit.state == PaymentMethod.payLater)
                        "${AppStrings.phone}: ${paymentCubit.phoneNumberController.text}",
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: AnimatedGradientButton(
              text: AppStrings.submitOrder,
              onPressed: () => _submitOrder(context),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailSection extends StatelessWidget {
  final String title;
  final List<String> details;

  const OrderDetailSection({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const Divider(),
          ...details.map(
            (detail) => Padding(
              padding: EdgeInsets.symmetric(vertical: 0.7.h),
              child: Text(
                detail,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderProcessingDialog extends StatelessWidget {
  const OrderProcessingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(color: AppColors.primary),
            SizedBox(height: 2.h),
            Text(
              AppStrings.processingOrder,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const SuccessDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, color: AppColors.success, size: 25.w),
            const CustomHeader(title: AppStrings.orderSuccessTitle,
                subtitle: AppStrings.orderSuccessMessage),

            SizedBox(height: 3.h),
            Center(
              child: AnimatedGradientButton(
                text: AppStrings.ok,
                onPressed: onConfirm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

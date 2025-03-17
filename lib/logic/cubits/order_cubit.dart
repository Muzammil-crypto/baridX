import 'package:baridx_orderflow/core/utils/logger.dart';
import 'package:baridx_orderflow/logic/cubits/package_details_cubit.dart';
import 'package:baridx_orderflow/logic/cubits/payment_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_enums.dart';
import '../../core/constants/app_strings.dart';
import '../../core/services/dialog_service.dart';
import '../../data/repositories/order_repository.dart';
import '../../dependency_injection/service_locator.dart';
import '../../routes/app_router.dart';
import 'customer_info_cubit.dart';

class OrderCubit extends Cubit<bool> {
  final OrderRepository orderRepository;
  final paymentCubit = locator<PaymentCubit>();
  final customerCubit = locator<CustomerInfoCubit>();
  final packageCubit = locator<PackageDetailsCubit>();
  final DialogService _dialogService = locator<DialogService>();
  OrderCubit({required this.orderRepository}) : super(false);

  /// Submit Order
  void handleSubmitOrder() async {
    if (_dialogService.navigatorKey.currentContext == null) {
      Logger.debugPrint("OrderCubit: Dialog context is not available yet!");
      return;
    }
    _dialogService.showProcessingDialog();
    Logger.debugPrint("Submitting order");
    bool success = await _submitOrder();

    _dialogService.closeDialog();
    if (success) {
      _dialogService.showSuccessDialog(() => AppRouter.replaceToHome());
    }
  }

  Future<bool> _submitOrder() async {
    emit(true);
    final success = await orderRepository.submitOrder();
    emit(false);
    return success;
  }

  /// Get Customer Details
  List<String> getCustomerDetails() {
    return [
      "${AppStrings.name}: ${customerCubit.firstNameController.text} ${customerCubit.secondNameController.text}",
      "${AppStrings.phone}: ${customerCubit.phoneController.text}",
      "${AppStrings.address}: ${customerCubit.addressController.text}",
    ];
  }

  /// Get Package Details
  List<String> getPackageDetails() {
    return [
      "${AppStrings.packageType}: ${packageCubit.selectedPackageType ?? 'N/A'}",
      "${AppStrings.weight}: ${packageCubit.weightController.text} kg",
      if (packageCubit.notesController.text.isNotEmpty)
        "${AppStrings.deliveryNotes}: ${packageCubit.notesController.text}",
    ];
  }

  /// Get Payment Details
  List<String> getPaymentDetails() {
    final selectedMethod = paymentCubit.selectedMethod.value;

    switch (selectedMethod) {
      case PaymentMethod.creditCard:
        return ["${AppStrings.paymentMethod}: ${selectedMethod.name}", "${AppStrings.cardNumber}: ${paymentCubit.cardNumberController.text}"];
      case PaymentMethod.cashOnDelivery:
        return ["${AppStrings.selectedPaymentMethod}: ${AppStrings.cashOnDelivery}"];
      case PaymentMethod.payLater:
        return ["${AppStrings.paymentMethod}: ${selectedMethod.name}", "${AppStrings.phone}: ${paymentCubit.phoneNumberController.text}"];
      case PaymentMethod.goBack: return [""];
    }
  }
}

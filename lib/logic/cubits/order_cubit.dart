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

  /// Retrieves dependent cubits from service locator to access form data.
  final paymentCubit = locator<PaymentCubit>();
  final customerCubit = locator<CustomerInfoCubit>();
  final packageCubit = locator<PackageDetailsCubit>();

  /// DialogService for displaying processing and success dialogs.
  final DialogService _dialogService = locator<DialogService>();

  OrderCubit({required this.orderRepository}) : super(false);

  /// Handles order submission process.
  void handleSubmitOrder() async {
    /// Ensures the dialog service context is available before proceeding.
    if (_dialogService.navigatorKey.currentContext == null) {
      Logger.debugPrint("OrderCubit: Dialog context is not available yet!");
      return;
    }

    /// Shows a processing dialog while submitting the order.
    _dialogService.showProcessingDialog();
    Logger.debugPrint("Submitting order");

    /// Calls order submission and waits for success response.
    bool success = await _submitOrder();

    /// Closes the dialog after processing.
    _dialogService.closeDialog();

    /// Displays a success dialog and navigates home if order was successful.
    if (success) {
      _dialogService.showSuccessDialog(() => AppRouter.replaceToHome());
    }
  }

  /// Simulates an API request for order submission.
  Future<bool> _submitOrder() async {
    emit(true); // Indicates loading state.
    final success = await orderRepository.submitOrder();
    emit(false); // Restores default state after submission.
    return success;
  }

  /// Retrieves formatted customer details.
  List<String> getCustomerDetails() {
    return [
      "${AppStrings.name}: ${customerCubit.firstNameController.text} ${customerCubit.secondNameController.text}",
      "${AppStrings.phone}: ${customerCubit.phoneController.text}",
      "${AppStrings.address}: ${customerCubit.addressController.text}",
    ];
  }

  /// Retrieves formatted package details.
  List<String> getPackageDetails() {
    return [
      "${AppStrings.packageType}: ${packageCubit.selectedPackageType ?? 'N/A'}",
      "${AppStrings.weight}: ${packageCubit.weightController.text} kg",
      if (packageCubit.notesController.text.isNotEmpty)
        "${AppStrings.deliveryNotes}: ${packageCubit.notesController.text}",
    ];
  }

  /// Retrieves formatted payment details based on selected method.
  List<String> getPaymentDetails() {
    final selectedMethod = paymentCubit.selectedMethod.value;

    switch (selectedMethod) {
      case PaymentMethod.creditCard:
        return [
          "${AppStrings.paymentMethod}: ${selectedMethod.name}",
          "${AppStrings.cardNumber}: ${paymentCubit.cardNumberController.text}",
        ];

      case PaymentMethod.cashOnDelivery:
        return ["${AppStrings.selectedPaymentMethod}: ${AppStrings.cashOnDelivery}"];

      case PaymentMethod.payLater:
        return [
          "${AppStrings.paymentMethod}: ${selectedMethod.name}",
          "${AppStrings.phone}: ${paymentCubit.phoneNumberController.text}",
        ];

      case PaymentMethod.goBack:
        return [""];
    }
  }
}

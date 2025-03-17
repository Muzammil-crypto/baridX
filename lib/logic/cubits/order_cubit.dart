import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/order_repository.dart';
import '../../presentation/widgets/general/dialogs/order_process_dialog.dart';
import '../../presentation/widgets/general/dialogs/sucess_dialog.dart';
import '../../routes/app_router.dart';

class OrderCubit extends Cubit<bool> {
  final OrderRepository orderRepository;

  OrderCubit({required this.orderRepository}) : super(false);

  Future<bool> submitOrder() async {
    emit(true);
    final success = await orderRepository.submitOrder();
    emit(false);
    return success;
  }

  void handleSubmitOrder(BuildContext context) {

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const OrderProcessingDialog(),
    );

   submitOrder().then((success) {
      Navigator.of(context).pop();
      if (success) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => SuccessDialog(
            onConfirm: () => AppRouter.replaceToHome(),
          ),
        );
      }
    });
  }
}

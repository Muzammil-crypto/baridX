import '../../data/models/order_model.dart';
import '../../data/repositories/order_repository.dart';

class SubmitOrderUseCase {
  final OrderRepository orderRepository;

  SubmitOrderUseCase({required this.orderRepository});

  Future<OrderModel> execute(OrderModel order) async {
    return await orderRepository.createOrder(order);
  }
}

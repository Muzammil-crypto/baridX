import '../../data/models/order_model.dart';
import '../../data/repositories/order_repository.dart';

class FetchOrdersUseCase {
  final OrderRepository orderRepository;

  FetchOrdersUseCase({required this.orderRepository});

  Future<List<OrderModel>> execute() async {
    return await orderRepository.getAllOrders();
  }
}

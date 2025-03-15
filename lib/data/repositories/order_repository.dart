import '../models/order_model.dart';
import '../../core/network/api_client.dart';
import '../../core/network/endpoints.dart';

class OrderRepository {
  final ApiClient apiClient;

  OrderRepository({required this.apiClient});

  /// Create a new order
  Future<OrderModel> createOrder(OrderModel order) async {
    final response = await apiClient.post(Endpoints.createOrder, body: order.toJson());
    return OrderModel.fromJson(response);
  }

  /// Fetch an order by ID
  Future<OrderModel> getOrder(String orderId) async {
    final response = await apiClient.get('${Endpoints.getOrder}$orderId');
    return OrderModel.fromJson(response);
  }

  /// Fetch all orders
  Future<List<OrderModel>> getAllOrders() async {
    final response = await apiClient.get(Endpoints.getAllOrders);
    return (response as List).map((order) => OrderModel.fromJson(order)).toList();
  }
}

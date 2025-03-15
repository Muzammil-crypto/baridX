// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/models/order_model.dart';
// import '../../domain/use_cases/fetch_orders_use_case.dart';
// import '../../domain/use_cases/submit_order_use_case.dart';
//
// part 'order_state.dart';
//
// class OrderCubit extends Cubit<OrderState> {
//   final FetchOrdersUseCase fetchOrdersUseCase;
//   final SubmitOrderUseCase submitOrderUseCase;
//
//   OrderCubit({
//     required this.fetchOrdersUseCase,
//     required this.submitOrderUseCase,
//   }) : super(OrderInitial());
//
//   /// Fetch Orders
//   Future<void> fetchOrders() async {
//     try {
//       emit(OrderLoading());
//       final orders = await fetchOrdersUseCase.execute();
//       emit(OrderLoaded(orders));
//     } catch (e) {
//       emit(OrderError(e.toString()));
//     }
//   }
//
//   /// Submit Order
//   Future<void> submitOrder(OrderModel order) async {
//     try {
//       emit(OrderSubmitting());
//       final submittedOrder = await submitOrderUseCase.execute(order);
//       emit(OrderSubmitted(submittedOrder));
//     } catch (e) {
//       emit(OrderError(e.toString()));
//     }
//   }
// }

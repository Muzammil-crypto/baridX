import 'package:baridx_orderflow/core/network/endpoints.dart';
import 'package:baridx_orderflow/data/repositories/order_repository.dart';
import 'package:baridx_orderflow/logic/cubits/customer_info_cubit.dart';
import 'package:baridx_orderflow/logic/cubits/home_cubit.dart';
import 'package:baridx_orderflow/logic/cubits/intro_cubit.dart';
import 'package:baridx_orderflow/logic/cubits/package_details_cubit.dart';
import 'package:baridx_orderflow/logic/cubits/payment_cubit.dart';
import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../core/network/api_client.dart';
import '../core/services/dialog_service.dart';
import '../logic/cubits/order_cubit.dart';

/// Creates a singleton instance of GetIt for dependency injection.
final GetIt locator = GetIt.instance;

/// Registers all services, repositories, and cubits needed throughout the app.
/// This ensures centralized management and reduces the need for manually passing dependencies.
void setupLocator() {

  /// Registers GoRouter as a singleton for centralized navigation handling.
  locator.registerLazySingleton<GoRouter>(() => AppRouter.router);

  /// Registers ApiClient as a singleton, allowing shared access to network requests.
  locator.registerLazySingleton(() => ApiClient(baseUrl: Endpoints.baseUrl));

  /// Registers DialogService to manage global dialogs without requiring a BuildContext.
  locator.registerLazySingleton(() => DialogService());

  /// Registers Cubits as lazy singletons to persist state across screens.
  locator.registerLazySingleton(() => CustomerInfoCubit());
  locator.registerLazySingleton(() => PackageDetailsCubit());
  locator.registerLazySingleton<PaymentCubit>(() => PaymentCubit());

  /// Registers the OrderRepository with dependency on ApiClient.
  /// This ensures API calls are handled efficiently with proper separation from UI logic.
  locator.registerLazySingleton(() => OrderRepository(apiClient: locator<ApiClient>()));

  /// Registers OrderCubit as a factory, creating a new instance when needed.
  /// This ensures fresh state handling for each new order.
  locator.registerFactory(() => OrderCubit(orderRepository: locator<OrderRepository>()));

  /// Registers IntroCubit with parameters for animation handling.
  locator.registerFactoryParam<IntroCubit, BuildContext, TickerProvider>(
          (context, vsync) => IntroCubit(context: context, vsync: vsync));

  /// Registers HomeCubit with a TickerProvider to manage animations.
  locator.registerFactoryParam<HomeCubit, TickerProvider, void>(
          (vsync, _) => HomeCubit(vsync: vsync));
}

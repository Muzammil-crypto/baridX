import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import '../../data/repositories/order_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../../core/network/api_client.dart';
import '../../logic/cubits/user_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Register Go Router
  locator.registerLazySingleton<GoRouter>(() => AppRouter.router);
  // Register API Client
  locator.registerLazySingleton(
      () => ApiClient(baseUrl: "https://api.baridx.com"));

  // Register Repositories
  locator.registerLazySingleton(() => OrderRepository(apiClient: locator()));
  locator.registerLazySingleton(() => UserRepository(apiClient: locator()));

  // Register Cubits
  // locator.registerFactory(() => OrderCubit(
  //   fetchOrdersUseCase: locator(),
  //   submitOrderUseCase: locator(),
  // ));

  locator.registerFactory(() => UserCubit(userRepository: locator()));
}

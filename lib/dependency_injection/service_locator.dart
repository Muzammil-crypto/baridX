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
import '../logic/cubits/order_cubit.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<GoRouter>(() => AppRouter.router);
  locator.registerLazySingleton(() => ApiClient(baseUrl: Endpoints.baseUrl));
  locator.registerLazySingleton(() => CustomerInfoCubit());
  locator.registerLazySingleton(() => PackageDetailsCubit());
  locator.registerLazySingleton<PaymentCubit>(() => PaymentCubit());
  locator.registerLazySingleton(() => OrderRepository(apiClient: locator<ApiClient>()));
  locator.registerFactory(() => OrderCubit(orderRepository: locator<OrderRepository>()));
  locator.registerFactoryParam<IntroCubit, BuildContext, TickerProvider>((context, vsync) => IntroCubit(context: context, vsync: vsync));
  locator.registerFactoryParam<HomeCubit, TickerProvider, void>((vsync, _) => HomeCubit(vsync: vsync),
  );
}


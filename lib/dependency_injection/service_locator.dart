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

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Register Go Router
  locator.registerLazySingleton<GoRouter>(() => AppRouter.router);
  // Register API Client
  locator.registerLazySingleton(
      () => ApiClient(baseUrl: "https://api.baridx.com"));
  locator.registerFactoryParam<IntroCubit, BuildContext, TickerProvider>(
      (context, vsync) => IntroCubit(context: context, vsync: vsync));
  locator.registerFactoryParam<HomeCubit, TickerProvider, void>(
    (vsync, _) => HomeCubit(vsync: vsync),
  );
  // Register Cubits as Singleton so they persist across screens
  locator.registerLazySingleton(() => CustomerInfoCubit());
  locator.registerLazySingleton(() => PackageDetailsCubit());
  locator.registerLazySingleton(() => PaymentCubit());
}

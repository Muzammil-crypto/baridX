import 'package:baridx_orderflow/logic/cubits/package_details_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/payment_cubit.dart';

/// Provides a shortcut to access `PaymentCubit` from any widget's `BuildContext`.
extension PaymentCubitX on BuildContext {
  PaymentCubit get payCubit => read<PaymentCubit>();
}

/// Provides a shortcut to access `PackageDetailsCubit` from any widget's `BuildContext`.
extension PackageDetailsCubitX on BuildContext {
  PackageDetailsCubit get pkgCubit => read<PackageDetailsCubit>();
}

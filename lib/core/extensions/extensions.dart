import 'package:baridx_orderflow/logic/cubits/package_details_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubits/payment_cubit.dart';

extension PaymentCubitX on BuildContext {
  PaymentCubit get payCubit => read<PaymentCubit>();
}
extension PackageDetailsCubitX on BuildContext {
  PackageDetailsCubit get pkgCubit => read<PackageDetailsCubit>();
}

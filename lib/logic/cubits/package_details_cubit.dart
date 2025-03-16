import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/app_router.dart';

class PackageDetailsCubit extends Cubit<void> {
  PackageDetailsCubit() : super(null);
  final formKey = GlobalKey<FormState>();
  String? selectedPackageType;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  void nextStep() {
    if (formKey.currentState!.validate()) {
      AppRouter.goPayment();
    }
  }

  String? onDropDownChanged(String? value) {
    selectedPackageType = value;
    return selectedPackageType;
  }
}
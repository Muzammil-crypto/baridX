import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../routes/app_router.dart';

class PackageDetailsCubit extends Cubit<void> {
  PackageDetailsCubit() : super(null);

  /// Form key to manage form validation.
  final formKey = GlobalKey<FormState>();

  /// Stores the selected package type.
  String? selectedPackageType;

  /// Controllers for package weight and delivery notes input fields.
  final TextEditingController weightController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  /// Validates form and navigates to the next step (Payment screen).
  void nextStep() {
    if (formKey.currentState!.validate()) {
      AppRouter.goPayment();
    }
  }

  /// Updates the selected package type when the dropdown value changes.
  String? onDropDownChanged(String? value) {
    selectedPackageType = value;
    return selectedPackageType;
  }
}

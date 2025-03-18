import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CustomerInfoCubit extends Cubit<void> {
  /// Form key to manage validation state.
  final formKey = GlobalKey<FormState>();

  /// Controllers for handling user input fields.
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  CustomerInfoCubit() : super(null);

  /// Disposes controllers to prevent memory leaks when Cubit is closed.
  void disposeControllers() {
    firstNameController.dispose();
    secondNameController.dispose();
    addressController.dispose();
    phoneController.dispose();
  }

  /// Validates the form fields and returns true if all inputs are valid.
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  /// Proceeds to the next step (Package Details) only if form validation succeeds.
  void nextStep() {
    if (validateForm()) {
      AppRouter.goPackageDetails();
    }
  }
}

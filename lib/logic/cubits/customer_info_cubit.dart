import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CustomerInfoCubit extends Cubit<void> {
  /// Form related variables
  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  CustomerInfoCubit() : super(null);


  /// disposing controllers to avoid memory leaks
  void disposeControllers() {
    firstNameController.dispose();
    secondNameController.dispose();
    addressController.dispose();
    phoneController.dispose();
  }
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
  void nextStep() {
    if (validateForm()) {
      AppRouter.goPackageDetails();
    }
  }
}

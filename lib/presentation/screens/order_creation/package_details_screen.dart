import 'package:baridx_orderflow/presentation/widgets/base/custom_button.dart';
import 'package:baridx_orderflow/presentation/widgets/base/dropdown_widget.dart';
import 'package:baridx_orderflow/presentation/widgets/base/form_field.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import 'package:go_router/go_router.dart';

class PackageDetailsScreen extends StatefulWidget {
  const PackageDetailsScreen({Key? key}) : super(key: key);

  @override
  _PackageDetailsScreenState createState() => _PackageDetailsScreenState();
}

class _PackageDetailsScreenState extends State<PackageDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedPackageType;
  final TextEditingController weightController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      GoRouter.of(context).push('/payment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.packageDetails)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownWidget(
                hintText: "Select Package Type",
                items: ["Small", "Medium", "Large"],
                selectedValue: selectedPackageType,
                onChanged: (value) {
                  setState(() {
                    selectedPackageType = value;
                  });
                },
              ),
              FormFieldWidget(
                label: "Weight (kg)",
                hintText: "Enter weight",
                controller: weightController,
                keyboardType: TextInputType.number,
                validator: (value) => double.tryParse(value!) == null ? "Invalid weight" : null,
              ),
              FormFieldWidget(
                label: "Delivery Notes",
                hintText: "Optional notes",
                controller: notesController,
              ),
              const SizedBox(height: 20),
              CustomButton(text: "Next", onPressed: _nextStep),
            ],
          ),
        ),
      ),
    );
  }
}

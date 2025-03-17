import 'package:flutter/material.dart';
import '../../presentation/widgets/general/dialogs/order_process_dialog.dart';
import '../../presentation/widgets/general/dialogs/sucess_dialog.dart';

/// Service for showing dialogs globally in the application.
class DialogService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get _context => navigatorKey.currentContext;

  void showProcessingDialog() {
    if (_context == null) {
      debugPrint("DialogService: No available context for showing a dialog!");
      return;
    }
    showDialog(
      context: _context!,
      barrierDismissible: false,
      builder: (context) => const OrderProcessingDialog(),
    );
  }

  void showSuccessDialog(VoidCallback onConfirm) {
    if (_context == null) {
      debugPrint("DialogService: No available context for showing a success dialog!");
      return;
    }
    showDialog(
      context: _context!,
      barrierDismissible: false,
      builder: (context) => SuccessDialog(onConfirm: onConfirm),
    );
  }

  void closeDialog() {
    if (_context != null && Navigator.of(_context!).canPop()) {
      Navigator.of(_context!).pop();
    } else {
      debugPrint("DialogService: No dialog to close!");
    }
  }
}

import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/presentation/widgets/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.orangeAccent])),
        padding: EdgeInsets.only(left: 12, right: 12),
        child: Center(
          child: CustomButton(
            text: "Start Order",
            onPressed: () {
              GoRouter.of(context).push('/customer-info');
            },
          ),
        ),
      ),
    );
  }
}

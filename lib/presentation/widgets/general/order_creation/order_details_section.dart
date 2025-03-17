import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_styles.dart';

class OrderDetailSection extends StatelessWidget {
  final String title;
  final List<String> details;

  const OrderDetailSection({
    super.key,
    required this.title,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.orderDetailTitleStyle,
          ),
          const Divider(),
          ...details.map(
                (detail) => Padding(
              padding: EdgeInsets.symmetric(vertical: 0.7.h),
              child: Text(
                detail,
                style: AppStyles.orderDetailTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

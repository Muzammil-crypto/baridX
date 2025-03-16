import 'package:baridx_orderflow/core/constants/app_colors.dart';
import 'package:baridx_orderflow/core/constants/app_styles.dart';
import 'package:baridx_orderflow/routes/app_router.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight > 0 ? constraints.maxHeight * 0.15 : 70;
        double iconSize = height * 0.4;
        double padding = height * 0.2;
        double fontSize = height * 0.35;

        return Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.blurSoftPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(height * 0.3), // Responsive curve
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: padding),
          height: height,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back Button (if enabled)
                if (showBackButton)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: 1.0,
                    child: GestureDetector(
                      onTap: () => AppRouter.goBack(),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(height * 0.15),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ),

                // AppBar Title
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: AppStyles.appBarTitleStyle.copyWith(
                        fontSize: fontSize > 18 ? fontSize : 18, // Ensures text is visible
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                // Action Buttons (if any)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions ?? [],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

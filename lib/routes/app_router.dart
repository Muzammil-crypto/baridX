import 'package:baridx_orderflow/core/constants/routes.dart';
import 'package:baridx_orderflow/dependency_injection/service_locator.dart';
import 'package:baridx_orderflow/presentation/screens/home_screen.dart';
import 'package:baridx_orderflow/presentation/screens/introduction/intro_screen.dart';
import 'package:baridx_orderflow/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_enums.dart';
import '../core/services/dialog_service.dart';
import '../presentation/screens/order_creation/customer_info_screen.dart';
import '../presentation/screens/order_creation/package_details_screen.dart';
import '../presentation/screens/order_creation/payment_screen.dart';
import '../presentation/screens/order_creation/review_submit_screen.dart';

class AppRouter {
  /// GoRouter instance
  static final GoRouter router = GoRouter(
    /// List of routes
    routes: _routes,
    /// Navigator key for DialogService
    navigatorKey: locator<DialogService>().navigatorKey,
  );

  /// Initialize the AppRouter
  static void goIntro() => locator<GoRouter>().go(introRoute);
  static void goSplash() => locator<GoRouter>().push(splashRoute);
  static void goHome() => locator<GoRouter>().push(homeRoute);
  static void replaceToHome() => locator<GoRouter>().go(homeRoute);
  static void goCustomerInfo() => locator<GoRouter>().push(customerInfoRoute);
  static void goPackageDetails() => locator<GoRouter>().push(packageDetailsRoute);
  static void goPayment() => locator<GoRouter>().push(paymentRoute);
  static void goReviewSubmit() => locator<GoRouter>().push(reviewSubmitRoute);
  static void goBack() {
    if (router.canPop()) {
      router.pop();
    } else {
      goHome();
    }
  }
  /// List of Routes
  static final List<GoRoute> _routes = [
    _animatedRoute('/', const IntroScreen(), transitionType: TransitionType.fade),
    _animatedRoute('/splash', const SplashScreen(), transitionType: TransitionType.scale),
    _animatedRoute('/home', const HomeScreen(), transitionType: TransitionType.slide),
    _animatedRoute('/customer-info', CustomerInfoScreen(), transitionType: TransitionType.slide),
    _animatedRoute('/package-details', PackageDetailsScreen(), transitionType: TransitionType.fade),
    _animatedRoute('/payment', const PaymentScreen(), transitionType: TransitionType.scale),
    _animatedRoute('/review-submit', ReviewSubmitScreen(), transitionType: TransitionType.slide),
  ];

  /// Helper method to create a GoRoute with custom transitions
  static GoRoute _animatedRoute(String path, Widget screen, {TransitionType transitionType = TransitionType.fade}) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (transitionType) {
            case TransitionType.fade:
              return FadeTransition(opacity: animation, child: child);
            case TransitionType.slide:
              return SlideTransition(
                position: animation.drive(Tween(begin: const Offset(1, 0),
                    end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut))),
                child: child,
              );
            case TransitionType.scale:
              return ScaleTransition(scale: animation, child: child);
          }
        },
      ),
    );
  }
}
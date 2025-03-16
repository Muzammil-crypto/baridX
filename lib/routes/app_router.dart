import 'package:baridx_orderflow/dependency_injection/service_locator.dart';
import 'package:baridx_orderflow/presentation/screens/home_screen.dart';
import 'package:baridx_orderflow/presentation/screens/introduction/intro_screen.dart';
import 'package:baridx_orderflow/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_enums.dart';
import '../presentation/screens/order_creation/customer_info_screen.dart';
import '../presentation/screens/order_creation/package_details_screen.dart';
import '../presentation/screens/order_creation/payment_screen.dart';
import '../presentation/screens/order_creation/review_submit_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      _animatedRoute('/', const IntroScreen(), transitionType: TransitionType.fade),
      _animatedRoute('/splash', const SplashScreen(), transitionType: TransitionType.scale),
      _animatedRoute('/home', const HomeScreen(), transitionType: TransitionType.slide),
      _animatedRoute('/customer-info', const CustomerInfoScreen(), transitionType: TransitionType.slide),
      _animatedRoute('/package-details', const PackageDetailsScreen(), transitionType: TransitionType.fade),
      _animatedRoute('/payment', const PaymentScreen(), transitionType: TransitionType.scale),
      _animatedRoute('/review-submit', const ReviewSubmitScreen(), transitionType: TransitionType.slide),
    ],
  );

  // Navigation Methods
  static void goIntro() => locator<GoRouter>().go('/');

  static void goSplash() => locator<GoRouter>().push('/splash');

  static void goHome() => locator<GoRouter>().push('/home');

  static void goCustomerInfo() => locator<GoRouter>().push('/customer-info');

  static void goPackageDetails() => locator<GoRouter>().push('/package-details');

  static void goPayment() => locator<GoRouter>().push('/payment');

  static void goReviewSubmit() => locator<GoRouter>().push('/review-submit');

  static void goBack() {
    final router = locator<GoRouter>();
    if (router.canPop()) {
      router.pop();
    } else {
      goHome();
    }
  }

  // Custom Animated Route Method
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
                position: animation.drive(Tween(begin: const Offset(1, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeInOut))),
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
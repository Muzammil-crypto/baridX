import 'package:baridx_orderflow/dependency_injection/service_locator.dart';
import 'package:baridx_orderflow/presentation/screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../presentation/screens/order_creation/customer_info_screen.dart';
import '../presentation/screens/order_creation/package_details_screen.dart';
import '../presentation/screens/order_creation/payment_screen.dart';
import '../presentation/screens/order_creation/review_submit_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/customer-info',
        builder: (context, state) => CustomerInfoScreen(),
      ),
      GoRoute(
        path: '/package-details',
        builder: (context, state) => const PackageDetailsScreen(),
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: '/review-submit',
        builder: (context, state) => const ReviewSubmitScreen(),
      ),
    ],

  );
  static void goHome() => locator<GoRouter>().go('/');

  static void goCustomerInfo() => locator<GoRouter>().push('/customer-info');

  static void goPackageDetails() => locator<GoRouter>().push('/package-details');

  static void goPayment() => locator<GoRouter>().push('/payment');

  static void goReviewSubmit() => locator<GoRouter>().push('/review-submit');

  static void goBack() {
    final router = locator<GoRouter>(); // Get GoRouter instance
    if (router.canPop()) {
      router.pop();
    } else {
      goHome(); // If no back stack, go home
    }
  }
}
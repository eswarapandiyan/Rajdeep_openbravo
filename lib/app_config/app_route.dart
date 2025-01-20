import 'package:flutter/material.dart';
import 'package:openbravo/app_pages/user_info/LoginScreen.dart';
import 'package:openbravo/app_pages/order_details/OrderDetailDescription.dart';
import 'package:openbravo/app_pages/order_details/OrderDetailsScreen.dart';
import 'package:openbravo/app_pages/outstanding_payment/OutstandingPaymentScreen.dart';
import 'package:openbravo/app_pages/price_list/price_list.dart';
import 'package:openbravo/app_pages/dashboard/dashboard.dart';
import 'package:openbravo/app_pages/splash_screen/splashScreen.dart';
// import '../app_pages/index_pages.dart';

class AppRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case "splash":
          return const SplashScreen();
        case "login":
          return const LoginPage();
        case "Dashboard":
          return const DashboardScreen();
        case "ProductListPage":
          return ProductPriceListPage();
        case "OrderDetailsPage":
          final salesOrder = settings.arguments as List;
          return OrderDetailsTable(
            orders: salesOrder,
          );
        case "OrderDetailDescription":
          final order = settings.arguments as Map<String, dynamic>;
          return OrderDetailScreen(
            order: order,
          );
        case "OutstandingPaymentPage":
          return Outstandingpaymentscreen();

        // case "otpVerification":
        //   final String mobileNo = settings.arguments as String;
        //   return OtpVerification(
        //     mobileNo: mobileNo,
        //   );
      }
      return const LoginPage();
    });
  }
}

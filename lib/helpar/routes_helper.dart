import 'package:deliveryboy/screen/dashboard_screen.dart';
import 'package:deliveryboy/screen/login_screen2.dart';
import 'package:deliveryboy/screen/myorder_screen.dart';
import 'package:deliveryboy/screen/orderdetails_screen.dart';
import 'package:deliveryboy/screen/registration_screen.dart';
import 'package:deliveryboy/screen/subscription_order.dart';
import 'package:deliveryboy/screen/subscriptiondetails_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String initial =
      "/driverLoginScreen"; // ✅ Ensure correct initial route
  static String driverLoginScreen = "/driverLoginScreen";
  static String dashboardScreen = "/dashboardScreen";
  static String myBookingScreen = "/myBookingScreen";
  static String orderDetailsScreen = "/orderDetailsScreen";
  static String myPriscriptionOrder = "/myPriscriptionOrder";
  static String myPriscriptionInfo = "/myPriscriptionInfo";
  static String registrationSceen = "/driverRegistrationScreen";
}

final getPages = [
  GetPage(
    name: Routes.driverLoginScreen,
    page: () => DriverLoginScreen(),
  ),
  GetPage(
    name: Routes.registrationSceen,
    page: () => DriverRegistrationScreen(),
  ),
  GetPage(
    name: Routes.dashboardScreen,
    page: () => DashBoardScreen(),
  ),
  GetPage(
    name: Routes.myBookingScreen,
    page: () => MyBookingScreen(isBack: "1"),
  ),
  GetPage(
    name: Routes.orderDetailsScreen,
    page: () => OrderdetailsScreen(),
  ),
  GetPage(
    name: Routes.myPriscriptionOrder,
    page: () => MyPriscriptionOrder(isBack: "1"),
  ),
  GetPage(
    name: Routes.myPriscriptionInfo,
    page: () => MyPriscriptionInfo(),
  ),
];

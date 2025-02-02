import 'package:deliveryboy/controller/dashboard_controller.dart';
import 'package:deliveryboy/controller/myorder_controller.dart';
import 'package:deliveryboy/controller/notificatio_controller.dart';
import 'package:deliveryboy/controller/pagelist_controller.dart';
import 'package:deliveryboy/controller/priscription_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register controllers
  Get.lazyPut(() => DashboardController());
  Get.lazyPut(() => MyOrderController());
  Get.lazyPut(() => PreScriptionControllre());
  Get.lazyPut(() => NotificationController());
  Get.lazyPut(() => PageListController());

  // ✅ Store initial route instead of calling Get.offAllNamed
  Get.put<String>("/driverLoginScreen", permanent: true);
}

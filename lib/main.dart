// // ignore_for_file: prefer_const_constructors

// import 'package:deliveryboy/screen/login_screen2.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/route_manager.dart';
// import 'package:get_storage/get_storage.dart';
// import 'helpar/get_di.dart' as di;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // ✅ Only one initialization
//   await Firebase.initializeApp();
//   await GetStorage.init();
//   await di.init();

//   await initPlatformState(); // ✅ Ensuring OneSignal is initialized before app starts

//   runApp(
//     GetMaterialApp(
//       title: "FastLaundry Rider App",
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: false,
//         primarySwatch: Colors.cyan,
//         fontFamily: "Gilroy",
//       ),
//       //home: DriverLoginScreen(),
//       // home: LoginScreen(),
//       //  home: ConfirmPickupScreen()
//       //  home: DropDetailsScreen(),
//       // home: CompletedScreen(),
//       // home: MyOrdersScreen(),
//       // home: MyPriscriptionOrder(),
//       // home: MyPriscriptionInfo(),
//       // home: ProfileScreen(),
//       //  initialRoute: Routes.initial,
//       //  getPages: getPages,
//       home: DriverLoginScreen(),
//     ),
//   );
// }

// // ✅ Ensuring `initPlatformState()` is properly defined
// Future<void> initPlatformState() async {
//   try {
//     OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//     OneSignal.initialize(
//         "YOUR-ONESIGNAL-APP-ID"); // 🔹 Replace with your OneSignal App ID

//     await OneSignal.Notifications.requestPermission(
//         true); // Request notifications

//     print("OneSignal Initialized Successfully!");
//   } catch (e) {
//     print("Error initializing OneSignal: $e");
//   }
// }

// ignore_for_file: prefer_const_constructors

import 'package:deliveryboy/helpar/routes_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'helpar/get_di.dart' as di;
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  await di
      .init(); // ✅ Ensuring dependencies are initialized before running the app
  // await initPlatformState(); // ✅ OneSignal initialization

  runApp(MyApp()); // ✅ Ensure GetMaterialApp is fully loaded first
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "FastLaundry Rider App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.cyan,
        fontFamily: "Gilroy",
      ),
      initialRoute: Routes.driverLoginScreen, // ✅ Corrected Initial Route
      getPages: getPages, // ✅ Ensure all routes are registered
    );
  }
}

// ✅ Initialize OneSignal Properly
// Future<void> initPlatformState() async {
//   try {
//     OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//     OneSignal.initialize(
//         "YOUR-ONESIGNAL-APP-ID"); // 🔹 Replace with your OneSignal App ID
//     await OneSignal.Notifications.requestPermission(true);
//     print("OneSignal Initialized Successfully!");
//   } catch (e) {
//     print("Error initializing OneSignal: $e");
//   }
// }

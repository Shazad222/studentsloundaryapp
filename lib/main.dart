// ignore_for_file: prefer_const_constructors

import 'package:deliveryboy/helpar/routes_helper.dart';
import 'package:deliveryboy/screen/login_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';
import 'helpar/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  await di.init();
  initPlatformState();
  runApp(
    GetMaterialApp(
      title: "FastLaundry Rider App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.cyan,
        fontFamily: "Gilroy",
      ),
      initialRoute: Routes.initial,
      getPages: getPages,
    ),
  );
}

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/model/dashboard_info.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:http/http.dart' as http;

import '../Api/dio_api.dart';

class DashboardController extends GetxController implements GetxService {
  final dioApi = Api();
  DashboardInfo? dashboardInfo;
  bool isLoading = false;
  getDashboardData({String? riderID}) async {
    try {
      Map map = {
        "rider_id": riderID,
      };
      String uri = Config.path + Config.dashboard;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        print(result.toString());
        dashboardInfo = DashboardInfo.fromJson(result);
      }
      isLoading = true;
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}

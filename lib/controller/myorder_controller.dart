// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/model/order_info.dart';
import 'package:deliveryboy/model/orderinformetion_info.dart';
import 'package:deliveryboy/utils/Custom_widget.dart';
import 'package:get/get.dart';

import '../Api/dio_api.dart';

class MyOrderController extends GetxController implements GetxService {
  OrderInfo? orderInfo;
  OrderInformetionInfo? orderInformetionInfo;
  bool isLoading = false;
  int currentIndex = 0;
  final dioApi = Api();

  changeIndexProductWise({int? index}) {
    currentIndex = index ?? 0;
    update();
  }

  myOrderHistory({String? statusWise}) async {
    try {
      Map map = {
        "rider_id": getData.read("StoreLogin")["id"],
        "status": statusWise,
      };
      String uri = Config.path + Config.myOrderApi;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        orderInfo = OrderInfo.fromJson(result);
      }
      isLoading = true;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  getOrderInformetion({String? orderID}) async {
    try {
      isLoading = false;
      update();
      Map map = {
        "order_id": orderID,
        "rider_id": getData.read("StoreLogin")["id"],
      };
      String uri = Config.path + Config.orderInformetion;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        orderInformetionInfo = OrderInformetionInfo.fromJson(result);
      }
      isLoading = true;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  mackDecisionApi({String? orderID, status, reson}) async {
    try {
      Map map = {
        "oid": orderID,
        "status": status,
        "comment_reject": reson,
      };
      print(map.toString());
      String uri = Config.path + Config.makeDecision;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      print("****************" + response.data.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        // if (result["Result"] == "true") {
        //   if (status == "1") {
        //     normalCompletedBottomSheet(oID: orderID);
        //   }
        // }

        if (status == "2") {
          Get.back();
        }
        myOrderHistory(statusWise: "Current");
        getOrderInformetion(orderID: orderID);
        showToastMessage(result["ResponseMsg"]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  completeOrderApi({String? orderID, image}) async {
    try {
      Map map = {
        "order_id": orderID,
        "rider_id": getData.read("StoreLogin")["id"],
        "img": image,
      };
      print(map.toString());
      String uri = Config.path + Config.completeOrder;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      print("****************" + response.data.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        showToastMessage(result["ResponseMsg"]);
        Dialogbox();
        getOrderInformetion(orderID: orderID);
      }
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}

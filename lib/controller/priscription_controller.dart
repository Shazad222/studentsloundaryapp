// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';

import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/model/preDetails_info.dart';
import 'package:deliveryboy/model/priscription_info.dart';
import 'package:deliveryboy/utils/Custom_widget.dart';
import 'package:get/get.dart';

import '../Api/dio_api.dart';

class PreScriptionControllre extends GetxController implements GetxService {
  PriscriptionInfo? priscriptionInfo;
  PreDetailsInfo? preDetailsInfo;
  bool isLoading = false;
  final dioApi = Api();
  String isComplite = "0";

  int currentIndex = 0;

  changeIndexProductWise({int? index}) {
    currentIndex = index ?? 0;
    update();
  }

  myPriscriptionOrderHistory({String? statusWise}) async {
    try {
      isLoading = false;

      Map map = {
        "rider_id": getData.read("StoreLogin")["id"],
        "status": statusWise,
      };
      String uri = Config.path + Config.subScriptionHistory;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      print(":::::::++++++" + response.data.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        print(":::::::++++++" + result.toString());

        priscriptionInfo = PriscriptionInfo.fromJson(result);
      }
      isLoading = true;
      update();
    } catch (e) {
      print(e.toString());
    }
  }

  myPriscriptionInformetion({String? oID}) async {
    try {
      isLoading = false;
      isComplite = "0";
      update();
      Map map = {
        "rider_id": getData.read("StoreLogin")["id"],
        "order_id": oID,
      };
      String uri = Config.path + Config.subScriptionInformetion;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      print("!!!!!!!!!!!!!!" + response.data.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        print("!!!!!!!!!!!!!!" + result.toString());
        preDetailsInfo = PreDetailsInfo.fromJson(result);
        for (var i = 0;
            i < preDetailsInfo!.orderProductList.orderProductData.length;
            i++) {
          for (var j = 0;
              j <
                  preDetailsInfo!
                      .orderProductList.orderProductData[i].totaldates.length;
              j++) {
            if (preDetailsInfo!.orderProductList.orderProductData[i]
                    .totaldates[j].isComplete !=
                true) {
              isComplite = "1";
            }
          }
        }
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
      print(":::::::::????????" + map.toString());
      String uri = Config.path + Config.preDecision;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      print(":::::::::????????" + response.data);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        // if (result["Result"] == "true") {
        //   if (status == "1") {
        //     completedBottomSheet(oID: orderID);
        //   }
        // }
        // if (status == "2") {}
        myPriscriptionOrderHistory(statusWise: "Current");
        myPriscriptionInformetion(oID: orderID);
        showToastMessage(result["ResponseMsg"]);
      }
      update();
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
      print("=====-------->>" + map.toString());
      String uri = Config.path + Config.preCompleteOrder;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      print("=====-------->>" + response.data.toString());
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        Dialogbox();
        myPriscriptionInformetion(oID: orderID);
        showToastMessage(result["ResponseMsg"]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  compliteDeliveries({String? orderId, selectDate, productId}) async {
    try {
      isLoading = false;
      Map map = {
        "order_id": orderId,
        "select_date": selectDate.toString().split(" ").first,
        "product_id": productId,
      };
// order_id
// select_date
      print("-----========>>" + map.toString());
      String uri = Config.path + Config.conpleteDeliveries;
      var response = await dioApi.sendRequest.post(
        uri,
        data: jsonEncode(map),
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.data);
        print(result.toString());
        showToastMessage(result["ResponseMsg"]);
        myPriscriptionInformetion(oID: orderId);
        Get.back();
      }
      isLoading = true;
      update();
    } catch (e) {
      print(e.toString());
    }
  }
}

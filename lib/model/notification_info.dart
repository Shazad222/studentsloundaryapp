// To parse this JSON data, do
//
//     final notificationInfo = notificationInfoFromJson(jsonString);

import 'dart:convert';

NotificationInfo notificationInfoFromJson(String str) =>
    NotificationInfo.fromJson(json.decode(str));

String notificationInfoToJson(NotificationInfo data) =>
    json.encode(data.toJson());

class NotificationInfo {
  NotificationInfo({
    required this.notificationData,
    required this.responseCode,
    required this.result,
    required this.responseMsg,
  });

  List<NotificationDatum> notificationData;
  String responseCode;
  String result;
  String responseMsg;

  factory NotificationInfo.fromJson(Map<String, dynamic> json) =>
      NotificationInfo(
        notificationData: List<NotificationDatum>.from(
            json["NotificationData"].map((x) => NotificationDatum.fromJson(x))),
        responseCode: json["ResponseCode"],
        result: json["Result"],
        responseMsg: json["ResponseMsg"],
      );

  Map<String, dynamic> toJson() => {
        "NotificationData":
            List<dynamic>.from(notificationData.map((x) => x.toJson())),
        "ResponseCode": responseCode,
        "Result": result,
        "ResponseMsg": responseMsg,
      };
}

class NotificationDatum {
  NotificationDatum({
    required this.id,
    required this.rid,
    required this.msg,
    required this.date,
  });

  String id;
  String rid;
  String msg;
  DateTime date;

  factory NotificationDatum.fromJson(Map<String, dynamic> json) =>
      NotificationDatum(
        id: json["id"],
        rid: json["rid"],
        msg: json["msg"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rid": rid,
        "msg": msg,
        "date": date.toIso8601String(),
      };
}

// class LoginResponse { // ✅ Updated class name
//   String? responseCode;
//   String? result;
//   String? responseMsg;
//   DriverDetails? driverDetails;

//   LoginResponse({this.responseCode, this.result, this.responseMsg, this.driverDetails});

//   LoginResponse.fromJson(Map<String, dynamic> json) {
//     responseCode = json['ResponseCode'];
//     result = json['Result'];
//     responseMsg = json['ResponseMsg'];
//     driverDetails = json['DriverDetails'] != null
//         ? DriverDetails.fromJson(json['DriverDetails'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['ResponseCode'] = responseCode;
//     data['Result'] = result;
//     data['ResponseMsg'] = responseMsg;
//     if (driverDetails != null) {
//       data['DriverDetails'] = driverDetails!.toJson();
//     }
//     return data;
//   }
// }

// class DriverDetails { // Class name remains unchanged
//   String? driverId;
//   String? driverName;
//   String? driverEmail;
//   String? securityToken;

//   DriverDetails({this.driverId, this.driverName, this.driverEmail, this.securityToken});

//   DriverDetails.fromJson(Map<String, dynamic> json) {
//     driverId = json['driver_id'];
//     driverName = json['driver_name'];
//     driverEmail = json['driver_email'];
//     securityToken = json['security_token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     data['driver_id'] = driverId;
//     data['driver_name'] = driverName;
//     data['driver_email'] = driverEmail;
//     data['security_token'] = securityToken;
//     return data;
//   }
// }
class LoginResponse {
  String? responseCode;
  String? result;
  String? responseMsg;
  DriverDetails? driverDetails;

  LoginResponse({this.responseCode, this.result, this.responseMsg, this.driverDetails});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    print("🔹 Parsing Response JSON: $json"); // Debugging Log

    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
    driverDetails = json['DriverDetails'] != null
        ? DriverDetails.fromJson(json['DriverDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ResponseCode'] = responseCode;
    data['Result'] = result;
    data['ResponseMsg'] = responseMsg;
    if (driverDetails != null) {
      data['DriverDetails'] = driverDetails!.toJson();
    }
    return data;
  }
}

class DriverDetails {
  String? driverId;
  String? driverName;
  String? driverEmail;
  String? securityToken;

  DriverDetails({this.driverId, this.driverName, this.driverEmail, this.securityToken});

  DriverDetails.fromJson(Map<String, dynamic> json) {
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverEmail = json['driver_email'];
    securityToken = json['security_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['driver_id'] = driverId;
    data['driver_name'] = driverName;
    data['driver_email'] = driverEmail;
    data['security_token'] = securityToken;
    return data;
  }
}

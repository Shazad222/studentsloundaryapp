// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/order_model.dart';

// class ApiService {
//   static const String _baseUrl = "https://laundry.saleselevation.tech/driver_api/";

//   // Fetch Assigned Orders
//   Future<List<Order>> getAssignedOrders(int driverId) async {
//     final url = Uri.parse("$_baseUrl/get_assign_orders.php?driver_id=$driverId");

//     final response = await http.get(
//       url,
//       headers: {
//         "Security-Token": "YOUR_SECURITY_TOKEN",  // Replace with actual token
//         "Content-Type": "application/json",
//       },
//     );

//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);

//       if (data['ResponseCode'] == "404") {
//         return []; // No assigned orders found
//       } else {
//         return (data['orders'] as List).map((order) => Order.fromJson(order)).toList();
//       }
//     } else {
//       throw Exception("Failed to load orders");
//     }
//   }
// }
// import 'dart:convert';
// import 'package:deliveryboy/model/user_model.dart';
// import 'package:http/http.dart' as http;

// class ApiService {
//   static const String _baseUrl = "https://laundry.saleselevation.tech/driver_api/driver_login.php";

//   static Future<LoginResponse?> login(String email, String password) async {
//     try {
//       Uri uri = Uri.parse("${_baseUrl}driver_login.php");

//       print("🔹 Sending API Request to: $uri");
//       print("🔹 Sending Data: Email = $email, Password = $password");

//       var response = await http.post(
//         uri,
//         body: {"email": email, "password": password}, // Form data
//         headers: {"Content-Type": "application/x-www-form-urlencoded"},
//       );

//       print("🔹 API Response Status Code: ${response.statusCode}");
//       print("🔹 API Response Body: ${response.body}");

//       if (response.statusCode == 200) {
//         try {
//           final Map<String, dynamic> responseData = json.decode(response.body);

//           if (responseData["Result"] == "true") {
//             print("✅ Login Successful: ${responseData['ResponseMsg']}");
//             return LoginResponse.fromJson(responseData);
//           } else {
//             print("❌ Login Failed: ${responseData['ResponseMsg']}");
//             return null;
//           }
//         } catch (e) {
//           print("🔴 JSON Parsing Error: $e");
//           return null;
//         }
//       } else {
//         print("🔴 Server Error: ${response.statusCode}");
//         return null;
//       }
//     } catch (e) {
//       print("🔴 API Call Failed: $e");
//       return null;
//     }
//   }
// }

import 'dart:convert';
import 'package:deliveryboy/model/driver_registrationmodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Helper method to perform POST requests
  Future<Map<String, dynamic>> _performPostRequest(
      String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error during request: $error');
    }
  }

  // Driver login API
  Future<DriverLoginResponse> driverLogin(String email, String password) async {
    const loginUrl =
        'https://laundry.saleselevation.tech/driver_api/driver_login.php';
    final body = {
      "driver_email": email,
      "driver_password": password,
    };

    try {
      final responseJson = await _performPostRequest(loginUrl, body);

      print('Login Response: ${responseJson}');

      // Parse and return the login response
      return DriverLoginResponse.fromJson(responseJson);
    } catch (error) {
      throw Exception('Error during login: $error');
    }
  }

  // Driver registration API
  Future<DriverRegistrationResponse> driverRegistration(
      Map<String, dynamic> data) async {
    const registerUrl =
        'https://laundry.saleselevation.tech/driver_api/rider_register.php';

    try {
      final responseJson = await _performPostRequest(registerUrl, data);

      print('Registration Response: ${responseJson}');

      // Parse and return the registration response
      return DriverRegistrationResponse.fromJson(responseJson);
    } catch (error) {
      throw Exception('Error during registration: $error');
    }
  }

  // Future<DriverRegistrationResponse> driverRegistration(
  //     Map<String, dynamic> data) async {
  //   const registerUrl =
  //       'https://laundry.saleselevation.tech/driver_api/rider_register.php';

  //   try {
  //     final responseJson = await _performPostRequest(registerUrl, data);

  //     print('Registration Response: ${responseJson}');

  //     // ✅ Ensure response matches the model
  //     return DriverRegistrationResponse.fromJson(responseJson);
  //   } catch (error) {
  //     throw Exception('Error during registration: $error');
  //   }
  // }
}

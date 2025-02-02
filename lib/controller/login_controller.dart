// import 'package:get/get.dart';
// import '../services/api_service.dart';
// import '../model/user_model.dart';
// import 'package:deliveryboy/screen/bottombar_screen.dart';
// import 'package:deliveryboy/Api/data_store.dart';

// class LoginController extends GetxController {
//   var isLoading = false.obs;
//   var loggedInUser = Rxn<LoginResponse>();
//   var errorMessage = ''.obs;

//   Future<void> login(String email, String password) async {
//     isLoading.value = true;
//     errorMessage.value = '';

//     print("🔹 Attempting Login with Email: $email");

//     final response = await ApiService.login(email, password);

//     print("🔹 Raw API Response in Controller: $response");

//     if (response != null) {
//       print("✅ Parsed Response: $response");
//       loggedInUser.value = response;
//       save("Firstuser", true);
//       save("DriverDetails", response.driverDetails);
//       Get.offAll(() => BottoBarScreen());
//       Get.snackbar("Success", "Login Successful", snackPosition: SnackPosition.BOTTOM);
//     } else {
//       print("❌ Login Failed: No response or invalid credentials.");
//       errorMessage.value = "Login Failed. Please try again.";
//       Get.snackbar("Error", errorMessage.value, snackPosition: SnackPosition.BOTTOM);
//     }

//     isLoading.value = false;
//   }
// }

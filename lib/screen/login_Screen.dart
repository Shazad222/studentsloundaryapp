// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/login_controller.dart';

// class LoginScreen extends StatelessWidget {
//   final LoginController loginController = Get.put(LoginController());
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Welcome Back",
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),

//               // Email Field
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(labelText: "Email"),
//                 validator: (value) => value!.isEmpty ? "Please enter email" : null,
//               ),
//               SizedBox(height: 20),

//               // Password Field
//               Obx(() => TextFormField(
//                     controller: passwordController,
//                     obscureText: loginController.isLoading.value,
//                     decoration: InputDecoration(labelText: "Password"),
//                     validator: (value) => value!.isEmpty ? "Please enter password" : null,
//                   )),
//               SizedBox(height: 20),

//               // Login Button
//               Obx(() {
//                 return ElevatedButton(
//                   onPressed: () {
//                     print("🔹 Login Button Clicked");
//                     print("🔹 Email: ${emailController.text}, Password: ${passwordController.text}");
//                     if (_formKey.currentState?.validate() ?? false) {
//                       loginController.login(emailController.text, passwordController.text);
//                     }
//                   },
//                   child: loginController.isLoading.value
//                       ? CircularProgressIndicator(color: Colors.white)
//                       : Text("Login"),
//                 );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

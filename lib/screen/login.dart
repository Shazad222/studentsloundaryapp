// import 'package:deliveryboy/helpar/fontfamily_model.dart';
// import 'package:deliveryboy/screen/login_Screen.dart';
// import 'package:deliveryboy/utils/Colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'becomedriver.dart';

// class DriverLoginScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               // Colors.lightBlue[100]!,
//               // Colors.lightBlue[200]!,
//               blueColor,
//             ],
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Circle with the letter "S"
//               CircleAvatar(
//                 radius: 50,
//                 backgroundColor: bgcolor,
//                 child: Text(
//                   'S',
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                     color: BlackColor,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Red dot
//               Icon(
//                 Icons.circle,
//                 color: RedColor,
//                 size: 8,
//               ),
//               SizedBox(height: 40),
//               // Log in button
//               ElevatedButton(
//                 onPressed: () {
//                   // Add login functionality
//                   //  Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(
//                   //       builder: (context) => Loginscreen()),
//                   // );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor:WhiteColor,
//                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                             'login'
//                             "Total",style: TextStyle(
//                               fontFamily: FontFamily.gilroyMedium,
//                               color: Darkblue,
//                               fontSize: 16,
//                             ),
//                           ),
//               ),
//               SizedBox(height: 20),
//               // Become Driver button
//               OutlinedButton(
//                 onPressed: () {
//                   // Add become driver functionality
//                   // Get.to(() => BecomeDriverScreen());
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => BecomeDriverScreen()),
//                   );
//                 },
//                 style: OutlinedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   side: BorderSide(color: Colors.blue),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: Text(
//                   'Become Driver',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // void main() {
// //   runApp(MaterialApp(
// //     debugShowCheckedModeBanner: false,
// //     home: DriverLoginScreen(),
// //   ));
// // }

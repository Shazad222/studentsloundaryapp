// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unnecessary_string_interpolations, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

// import 'package:deliveryboy/Api/Config.dart';
// import 'package:deliveryboy/Api/data_store.dart';
// import 'package:deliveryboy/controller/dashboard_controller.dart';
// import 'package:deliveryboy/controller/notificatio_controller.dart';
// import 'package:deliveryboy/helpar/fontfamily_model.dart';
// import 'package:deliveryboy/helpar/routes_helper.dart';
// import 'package:deliveryboy/model/user_model.dart';
// import 'package:deliveryboy/screen/login_Screen.dart';
// import 'package:deliveryboy/screen/notification_screen.dart';
// import 'package:deliveryboy/utils/Colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// var currency;

// class DashBoardScreen extends StatefulWidget {
//   const DashBoardScreen({super.key});

//   @override
//   State<DashBoardScreen> createState() => _DashBoardScreenState();
// }

// class _DashBoardScreenState extends State<DashBoardScreen> {
//   DashboardController dashboardController = Get.find();
//   NotificationController notificationController = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     dashboardController.getDashboardData(
//       riderID: getData.read("StoreLogin")["id"],
//     );
//     currency = getData.read("currency");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgcolor,
//       appBar: AppBar(
//         backgroundColor: gradient.defoultColor,
//         automaticallyImplyLeading: false,
//         titleSpacing: 0,
//         elevation: 0,
//         toolbarHeight: 60,
//         actions: [
//           SizedBox(
//             width: 8,
//           ),
//           Image.asset(
//             "assets/Group 427320349.png",
//             height: 140,
//             width: 140,
//           ),
//           Spacer(),
//           InkWell(
//             onTap: () {
//               notificationController.getNotificationData();
//               Get.to(() => NotificationScreen());
//             },
//             child: Container(
//               height: 50,
//               width: 50,
//               padding: EdgeInsets.all(12),
//               decoration: BoxDecoration(shape: BoxShape.circle, color: bgcolor),
//               child: Image.asset(
//                 "assets/Notification.png",
//                 color: gradient.defoultColor,
//               ),
//             ),
//           ),
//           SizedBox(width: Get.width * 0.025),
//           InkWell(
//             onTap: () {
//               setState(() {
//                 getData.remove('Firstuser');
//                 getData.remove('Remember');
//                 getData.remove("StoreLogin");
//               //   Navigator.pushReplacement(context,
//               //       // MaterialPageRoute(builder: (context) => Loginscreen()));
//               });
//             },
//             child: Container(
//               height: 50,
//               width: 50,
//               padding: EdgeInsets.all(14),
//               decoration: BoxDecoration(shape: BoxShape.circle, color: bgcolor),
//               child: Image.asset(
//                 "assets/log-out.png",
//                 color: gradient.defoultColor,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           )
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: () {
//           return Future.delayed(
//             Duration(seconds: 2),
//             () {
//               dashboardController.getDashboardData(
//                 riderID: getData.read("StoreLogin")["id"],
//               );
//             },
//           );
//         },
//         child: SizedBox(
//           height: Get.size.height,
//           width: Get.size.width,
//           child: Stack(
//             children: [
//               Container(
//                 height: Get.height / 5,
//                 width: Get.width,
//                 color: gradient.defoultColor,
//               ),
//               GetBuilder<DashboardController>(builder: (context) {
//                 return dashboardController.isLoading
//                     ? Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: Column(
//                           children: [
//                             SizedBox(height: Get.height * 0.02),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Flexible(
//                                   child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "Hello, Welcome Back",
//                                           style: TextStyle(
//                                             fontFamily: FontFamily.gilroyBold,
//                                             fontSize: 13,
//                                             color: WhiteColor.withOpacity(0.8),
//                                           ),
//                                         ),
//                                         Text(
//                                           getData.read("StoreLogin")["title"],
//                                           maxLines: 1,
//                                           style: TextStyle(
//                                             fontFamily: FontFamily.gilroyBold,
//                                             fontSize: 20,
//                                             color: WhiteColor,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ),
//                                       ]),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: Get.height * 0.02),
//                             GridView.builder(
//                               itemCount: dashboardController
//                                   .dashboardInfo?.reportData.length,
//                               shrinkWrap: true,
//                               padding: EdgeInsets.zero,
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 mainAxisSpacing: 8,
//                                 crossAxisSpacing: 8,
//                                 mainAxisExtent: 130,
//                               ),
//                               itemBuilder: (context, index) {
//                                 return InkWell(
//                                   onTap: () {
//                                     if (index == 0) {
//                                       Get.toNamed(Routes.myBookingScreen);
//                                     } else if (index == 2) {
//                                       Get.toNamed(Routes.myPriscriptionOrder);
//                                     }
//                                   },
//                                   child: Container(
//                                     padding: EdgeInsets.all(8),
//                                     child: Row(
//                                       children: [
//                                         Expanded(
//                                           child: SizedBox(
//                                             // width: Get.width * 0.36,
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceEvenly,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Image.network(
//                                                   "${Config.imageurl}${dashboardController.dashboardInfo?.reportData[index].url ?? ""}",
//                                                   height: 40,
//                                                 ),

//                                                 // SizedBox(
//                                                 //   height: 15,
//                                                 // ),
//                                                 // index / 9 == 1
//                                                 //     ? Text(
//                                                 //         "${getData.read("currency")}${dashboard.dashboardlist[index]["report_data"].toString()}",
//                                                 //         maxLines: 1,
//                                                 //         style: TextStyle(
//                                                 //           color: WhiteColor,
//                                                 //           fontFamily: FontFamily
//                                                 //               .gilroyBold,
//                                                 //           fontSize: 20,
//                                                 //           overflow: TextOverflow
//                                                 //               .ellipsis,
//                                                 //         ),
//                                                 //       )
//                                                 //     :
//                                                 // index / 9 == 1 ||
//                                                 //         index / 10 == 1 ||
//                                                 //         index / 14 == 1

//                                                 Flexible(
//                                                   child: Text(
//                                                     "${dashboardController.dashboardInfo?.reportData[index].title.toString() ?? ""}",
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                     maxLines: 1,
//                                                     textAlign: TextAlign.start,
//                                                     style: TextStyle(
//                                                       fontSize: 14,
//                                                       color: greyColor,
//                                                       fontFamily: FontFamily
//                                                           .gilroyExtraBold,
//                                                     ),
//                                                   ),
//                                                 ),

//                                                 Flexible(
//                                                   child: Text(
//                                                     "${dashboardController.dashboardInfo?.reportData[index].reportData ?? ""}",
//                                                     maxLines: 1,
//                                                     style: TextStyle(
//                                                       color: BlackColor,
//                                                       fontFamily:
//                                                           FontFamily.gilroyBold,
//                                                       fontSize: 20,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     decoration: BoxDecoration(
//                                       color: WhiteColor,
//                                       borderRadius: BorderRadius.circular(15),
//                                       // image: DecorationImage(
//                                       //   image: AssetImage("assets/dImage.png"),
//                                       //   fit: BoxFit.cover,
//                                       // ),
//                                     ),
//                                   ),

//                                   // Container(
//                                   //   child: Row(
//                                   //     children: [
//                                   //       SizedBox(width: 15),
//                                   //       SizedBox(
//                                   //         width: Get.width * 0.37,
//                                   //         child: Column(
//                                   //           crossAxisAlignment:
//                                   //               CrossAxisAlignment.start,
//                                   //           children: [
//                                   //             SizedBox(
//                                   //               height: 15,
//                                   //             ),
//                                   //             Text(
//                                   //               dashboardController
//                                   //                       .dashboardInfo
//                                   //                       ?.reportData[index]
//                                   //                       .reportData
//                                   //                       .toString() ??
//                                   //                   "",
//                                   //               maxLines: 1,
//                                   //               style: TextStyle(
//                                   //                 color: WhiteColor,
//                                   //                 fontFamily: FontFamily.gilroyBold,
//                                   //                 fontSize: 20,
//                                   //                 overflow: TextOverflow.ellipsis,
//                                   //               ),
//                                   //             ),
//                                   //             Text(
//                                   //               dashboardController.dashboardInfo
//                                   //                       ?.reportData[index].title ??
//                                   //                   "",
//                                   //               overflow: TextOverflow.ellipsis,
//                                   //               maxLines: 2,
//                                   //               style: TextStyle(
//                                   //                 fontSize: 20,
//                                   //                 color: BlackColor,
//                                   //                 fontFamily:
//                                   //                     FontFamily.gilroyExtraBold,
//                                   //               ),
//                                   //             ),
//                                   //           ],
//                                   //         ),
//                                   //       ),
//                                   //     ],
//                                   //   ),
//                                   //   decoration: BoxDecoration(
//                                   //     color: WhiteColor,
//                                   //     // border: Border.all(color: ),
//                                   //     borderRadius: BorderRadius.circular(15),
//                                   //     // image: DecorationImage(
//                                   //     //   image: AssetImage("assets/dImage.png"),
//                                   //     //   fit: BoxFit.cover,
//                                   //     // ),
//                                   //   ),
//                                   // ),
//                                 );
//                               },
//                             )
//                           ],
//                         ),
//                       )
//                     : Center(
//                         child: CircularProgressIndicator(
//                             color: gradient.defoultColor),
//                       );
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:deliveryboy/Api/Config.dart';
import 'package:deliveryboy/Api/data_store.dart';
import 'package:deliveryboy/controller/dashboard_controller.dart';
import 'package:deliveryboy/controller/notificatio_controller.dart';
import 'package:deliveryboy/helpar/fontfamily_model.dart';
import 'package:deliveryboy/helpar/routes_helper.dart';
import 'package:deliveryboy/model/user_model.dart';
import 'package:deliveryboy/screen/login_Screen.dart';
import 'package:deliveryboy/screen/notification_screen.dart';
import 'package:deliveryboy/utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var currency;

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DashboardController dashboardController = Get.find();
  NotificationController notificationController = Get.find();

  // Declare the driver data variable
  var driverData;

  @override
  void initState() {
    super.initState();
    // Get the driver data passed from DriverLoginScreen
    driverData = Get.arguments;

    dashboardController.getDashboardData(
      riderID: driverData != null ? driverData['id'] : '1', // Use the passed id
    );
    currency = getData.read("currency");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: gradient.defoultColor,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        elevation: 0,
        toolbarHeight: 60,
        actions: [
          SizedBox(width: 8),
          Image.asset(
            "assets/Group 427320349.png",
            height: 140,
            width: 140,
          ),
          Spacer(),
          InkWell(
            onTap: () {
              notificationController.getNotificationData();
              Get.to(() => NotificationScreen());
            },
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(shape: BoxShape.circle, color: bgcolor),
              child: Image.asset(
                "assets/Notification.png",
                color: gradient.defoultColor,
              ),
            ),
          ),
          SizedBox(width: Get.width * 0.025),
          InkWell(
            onTap: () {
              setState(() {
                getData.remove('Firstuser');
                getData.remove('Remember');
                getData.remove("StoreLogin");
              });
            },
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(shape: BoxShape.circle, color: bgcolor),
              child: Image.asset(
                "assets/log-out.png",
                color: gradient.defoultColor,
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 2),
            () {
              dashboardController.getDashboardData(
                riderID: driverData != null
                    ? driverData['id']
                    : '1', // Use the passed id
              );
            },
          );
        },
        child: SizedBox(
          height: Get.size.height,
          width: Get.size.width,
          child: Stack(
            children: [
              Container(
                height: Get.height / 5,
                width: Get.width,
                color: gradient.defoultColor,
              ),
              GetBuilder<DashboardController>(builder: (context) {
                return dashboardController.isLoading
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            SizedBox(height: Get.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Hello, Welcome Back",
                                          style: TextStyle(
                                            fontFamily: FontFamily.gilroyBold,
                                            fontSize: 13,
                                            color: WhiteColor.withOpacity(0.8),
                                          ),
                                        ),
                                        Text(
                                          driverData != null
                                              ? driverData['name']
                                              : 'Driver Name',
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily: FontFamily.gilroyBold,
                                            fontSize: 20,
                                            color: WhiteColor,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            SizedBox(height: Get.height * 0.02),
                            GridView.builder(
                              itemCount: dashboardController
                                  .dashboardInfo?.reportData.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 130,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.toNamed(Routes.myBookingScreen);
                                    } else if (index == 2) {
                                      Get.toNamed(Routes.myPriscriptionOrder);
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  "${Config.imageurl}${dashboardController.dashboardInfo?.reportData[index].url ?? ""}",
                                                  height: 40,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    "${dashboardController.dashboardInfo?.reportData[index].title.toString() ?? ""}",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: greyColor,
                                                      fontFamily: FontFamily
                                                          .gilroyExtraBold,
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    "${dashboardController.dashboardInfo?.reportData[index].reportData ?? ""}",
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      color: BlackColor,
                                                      fontFamily:
                                                          FontFamily.gilroyBold,
                                                      fontSize: 20,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: WhiteColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                            color: gradient.defoultColor),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

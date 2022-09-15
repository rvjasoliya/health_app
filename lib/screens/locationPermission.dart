import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/Widget/CustomButton.dart';
import 'package:health_app/others/constants.dart';
import 'package:health_app/routes.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermission extends StatefulWidget {
  @override
  _LocationPermissionState createState() => _LocationPermissionState();
}

class _LocationPermissionState extends State<LocationPermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              child: Text("SKIP", style: TextStyle(
                fontSize: 15,
                color: Colors.black87
              ),),
            ),
            onTap: (){
              Get.toNamed(Routes.homeScreen);
            },
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Helpful to find COVID-19 updates", style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ), textAlign: TextAlign.center,),
            Expanded(child: Container()),
            Container(
              height: 210,
              width: 210,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 50,
                ),
              ),
              child: Icon(
                Icons.location_on_rounded,
                color: AppColors.primaryColor,
                size: 60,
              ),
            ),
            Expanded(child: Container()),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButtonWidget(
                height: 45,
                text: "ENABLE LOCATION",
                bgColor: AppColors.primaryColor,
                padding: 10,
                fontSize: 16,
                txtColor: Colors.white,
                onPressed: () async {
                  await checkLocationPermission();
                  //Get.toNamed(Routes.homeScreen);
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  checkLocationPermission() async{
    var status = await Permission.location.status;
    if (status.isUndetermined) {
      Permission.location.request();
    }
    if (status.isDenied) {
      Permission.location.request();
    }
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }
    if (status.isGranted) {
      Get.toNamed(Routes.homeScreen);
    }
  }
}

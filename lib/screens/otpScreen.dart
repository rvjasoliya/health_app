import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/Widget/CustomButton.dart';
import 'package:health_app/others/common.dart';
import 'package:health_app/others/constants.dart';

import '../routes.dart';

class OTPScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xffEDF0F2),
        title: Text(
          'Enter your OTP',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              textAlign: TextAlign.center,
              maxLength: 4,
              decoration: InputDecoration(
                hintText: "0000",
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi elementum vestibulum dignissim.", style: TextStyle(
              fontSize: 12,
              color: AppColors.greyColor,
            ), textAlign: TextAlign.center,),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButtonWidget(
                height: 45,
                text: "RESEND OTP",
                bgColor: Colors.transparent,
                padding: 10,
                fontSize: 16,
                txtColor: Colors.black,
                onPressed: () {
                  //Get.toNamed(Routes.otpScreen);
                },
              ),
            ),
            Expanded(child: Container()),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomButtonWidget(
                height: 45,
                text: "CONTINUE",
                bgColor: AppColors.primaryColor,
                padding: 10,
                fontSize: 16,
                txtColor: Colors.white,
                onPressed: () {
                  Get.toNamed(Routes.locationPermission);
                },
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

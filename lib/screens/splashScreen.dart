import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/Controller/allControllers.dart';
import 'package:health_app/others/constants.dart';
import 'package:health_app/routes.dart';

import '../others/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  UserController _userController = Get.put(UserController());

  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 5),
            () => Get.offAllNamed(Routes.introScreen));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.secondaryColor, AppColors.primaryColor
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            Container(
              width: 200,
              height: 320,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.logo),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: 100,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.flag),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 8,),
            Text("Kingdom of Cambodia", style: TextStyle(
                color: Colors.white,
                fontSize: 16
            ),),
            SizedBox(height: 8,),
            Text("Nation | Religion | King", style: TextStyle(
                color: Colors.white,
                fontSize: 12
            ),),
            SizedBox(height: 25,),
          ],
        ),
      )
    );
  }
}
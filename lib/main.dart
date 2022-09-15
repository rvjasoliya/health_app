import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:health_app/routes.dart';
import 'package:health_app/screens/splashScreen.dart';

import 'others/constants.dart';
import 'others/constants.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData(
        fontFamily: AppFonts.primaryFont,
        primarySwatch: Colors.green
      ),
      getPages: Routes.route,
      initialRoute: Routes.splashScreen,
    );
  }
}




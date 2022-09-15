
import 'package:get/get.dart';
import 'package:health_app/screens/editProfile.dart';
import 'package:health_app/screens/homeScreen.dart';
import 'package:health_app/screens/introScreen.dart';
import 'package:health_app/screens/locationPermission.dart';
import 'package:health_app/screens/otpScreen.dart';
import 'package:health_app/screens/webView.dart';

import 'screens/loginPage.dart';
import 'screens/qnaScreen.dart';
import 'screens/splashScreen.dart';

class Routes {

  static var splashScreen = '/splashScreen';
  static var introScreen = '/introScreen';
  static var loginPage = '/loginPage';
  static var otpScreen = '/OTPScreen';
  static var locationPermission = '/LocationPermission';
  static var homeScreen = '/HomeScreen';
  static var webViewLoad = '/WebViewLoad';
  static var editProfile = '/EditProfile';
  static var qnaScreen = '/QNAScreen';

  static final route = [
    GetPage(name: splashScreen, page: () => SplashScreen(),),
    GetPage(name: introScreen, page: () => IntroScreen(),),
    GetPage(name: loginPage, page: () => LoginPage(),),
    GetPage(name: otpScreen, page: () => OTPScreen(),),
    GetPage(name: locationPermission, page: () => LocationPermission(),),
    GetPage(name: homeScreen, page: () => HomeScreen(),),
    GetPage(name: webViewLoad, page: () => WebViewLoad(),),
    GetPage(name: editProfile, page: () => EditProfile(),),
    GetPage(name: qnaScreen, page: () => QNAScreen(),),
  ];
}
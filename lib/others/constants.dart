

import 'dart:io';

import 'package:health_app/others/common.dart';

class AppConstants {
  static const appName = "Health App";
  static const packageId = "com.example.health_app";
  static const appIdIOS = "597851882";
  static const privacyPolicy = "assets/Privacy.html";
  static const apkLink = "https://play.google.com/store/apps/details?id=$packageId";
  static const iosLink = "https://apps.apple.com/in/app/photo-editor/id$appIdIOS";
  static var shareApkLink = Platform.isIOS ? iosLink : apkLink;
}

class AppFonts {
  static const primaryFont = "Roboto";
}

class AppColors{
  static var primaryColor = fromHex("#409A64");
  static var secondaryColor = fromHex("#AACC5B");
  static var bgColor = fromHex("#EDF0F2");
  static var redColor = fromHex("#FF072D");
  static var greyColor = fromHex("#505763");
  static var textFieldColor = fromHex("#EBF3F7");
  static var lightGreyColor = fromHex("#DDDED8");
}

class AppImages {
  static var logo = 'assets/images/logo.png';
  static var icn_smallLogo = 'assets/images/icn_smallLogo.png';
  static var dna = 'assets/images/dna.jpg';
  static var intro1 = 'assets/images/intro1.png';
  static var intro4 = 'assets/images/intro4.png';
  static var flag = 'assets/images/flag.png';
  static var food = 'assets/images/food.png';
  static var rsBanner1 = 'assets/images/rsBanner1.png';
  static var rsBanner2 = 'assets/images/rsBanner2.png';
  static var rsBanner3 = 'assets/images/rsBanner3.png';
  static var videoBanner = 'assets/images/videoBanner.png';
  static var healthBanner1 = 'assets/images/healthBanner1.png';
  static var healthBanner2 = 'assets/images/healthBanner2.png';
  static var healthBanner3 = 'assets/images/healthBanner3.png';
  static var healthBanner4 = 'assets/images/healthBanner4.png';
}

class AppIcons {
  static var icn_health = 'assets/icons/icn_health.png';
  static var icn_language = 'assets/icons/icn_language.png';
  static var icn_news = 'assets/icons/icn_news.png';
  static var icn_update = 'assets/icons/icn_update.png';
  static var icn_resource = 'assets/icons/icn_resource.png';
  static var icn_share = 'assets/icons/icn_share.png';
  static var icn_call = 'assets/icons/icn_call.png';
  static var icn_assess = 'assets/icons/icn_assess.png';
  static var icn_profile = 'assets/icons/icn_profile.png';
  static var icn_radio = 'assets/icons/icn_radio.png';
  static var icn_radio_s = 'assets/icons/icn_radio_s.png';
  static var icn_quote = 'assets/icons/icn_quote.png';
  static var icn_bluetooth = 'assets/icons/icn_bluetooth.png';
}

class AppErrors{
  static const fNameErr = "First Name can not be empty";
  static const mobileErr = "Mobile No is not valid";
  static const emailErr = "Email is not valid";
}
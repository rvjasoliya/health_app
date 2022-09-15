
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/others/storageManager.dart';

import '../others/constants.dart';

class UserController extends GetxController{

  TextEditingController nameTEC = TextEditingController();
  TextEditingController birthDateTEC = TextEditingController();
  TextEditingController mobileTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController genderTEC = TextEditingController();

  // signUpClick() async{
  //   Get.dialog(Center(child: CircularProgressIndicator()),
  //       barrierDismissible: false);
  //   if(fnameTEC.text.trim().length < 1){
  //     Get.snackbar("Alert!!", AppErrors.fNameErr);
  //     return;
  //   }
  //   if(lnameTEC.text.trim().length < 1){
  //     Get.snackbar("Alert!!", AppErrors.lNameErr);
  //     return;
  //   }
  //   if(mobileTEC.text.trim().length < 10 || mobileTEC.text.trim().length > 10){
  //     Get.snackbar("Alert!!", AppErrors.mobileErr);
  //     return;
  //   }
  //   if(!GetUtils.isEmail(emailTEC.text)){
  //     Get.snackbar("Alert!!", AppErrors.emailErr);
  //     return;
  //   }
  //   if(passwordTEC.text.trim().length < 1){
  //     Get.snackbar("Alert!!", AppErrors.passErr);
  //     return;
  //   }
  //   // var response =  await ApiManager().registerApi(
  //   //   fname: fnameTEC.text,
  //   //   lname: lnameTEC.text,
  //   //   mobile: mobileTEC.text,
  //   //   email: emailTEC.text,
  //   //   pass: passwordTEC.text,
  //   // );
  //   // var user = json.decode(response);
  //   // print("response");
  //   // if(user['access_token'] != null){
  //   //   Get.back();
  //   //   StorageManager().saveToken(token: user['access_token']);
  //   //   Get.offNamed('/bottomBar');
  //   // }
  // }
  //
  // signInClick() async{
  //   Get.dialog(Center(child: CircularProgressIndicator()),
  //       barrierDismissible: false);
  //   if(!GetUtils.isEmail(emailTEC.text)){
  //     Get.snackbar("Alert!!", AppErrors.emailErr);
  //     return;
  //   }
  //   if(passwordTEC.text.trim().length < 1){
  //     Get.snackbar("Alert!!", AppErrors.passErr);
  //     return;
  //   }
  //   // var response =  await ApiManager().loginApi(email: emailTEC.text, pass: passwordTEC.text);
  //   // var user = json.decode(response);
  //   // if(user['access_token'] != null) {
  //   //   Get.back();
  //   //   StorageManager().saveToken(token: user['access_token']);
  //   //   Get.offNamed('/bottomBar');
  //   // }
  // }
  //
  // submitClick() async{
  //   // Get.dialog(Center(child: CircularProgressIndicator()),
  //   //     barrierDismissible: false);
  //   if(!GetUtils.isEmail(emailTEC.text)){
  //     Get.snackbar("Alert!!", AppErrors.emailErr);
  //     return;
  //   }
  //   // var response =  await ApiManager().forgotApi(email: emailTEC.text,);
  //   // var user = json.decode(response);
  //   // print("response");
  //   // print(user);
  // }

}
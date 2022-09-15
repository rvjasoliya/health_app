import 'dart:math';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

class ShowSnackbar {
  showSnackBar(
      msg,
      color,
      duration,
      scaffoldKey,
      ) {
    scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        content: new Text(
          msg,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        duration: new Duration(seconds: duration),
        behavior: SnackBarBehavior.fixed,
        // elevation: 3.0,
        backgroundColor: color,
      ),
    );
  }
}

BoxDecoration boxDeco(double radius, Color color){
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color
  );
}

Text text(String text, Color color, double size, FontWeight weight, TextAlign align){
  return Text(
    text, style: TextStyle(
      color: color,
      fontWeight: weight,
      fontSize: size
  ),
    textAlign: align,
  );
}
setBoxShadow(color) {
  return [
    BoxShadow(
      color: color.withOpacity(0.3),
        blurRadius: 10.0,
        spreadRadius: 2.0,
        offset: Offset(0, 0)// changes position of shadow
    )
  ];
}

setOptionShadow(){
  return [
  BoxShadow(
  color: Colors.black.withOpacity(0.3),
  blurRadius: 5.0,
  spreadRadius: 4.0,
  offset: Offset(1.0, 1.0)// changes position of shadow
  )
  ];
}

setBoxShadowHomeScreen(color) {
  return [
    BoxShadow(
        color: color.withOpacity(0.2),
        blurRadius: 6.0,
        spreadRadius: 1.0,
        offset: Offset(0.0, 1.0)// changes position of shadow
    )
  ];
}

setWidgetShadow({double x, double y, double blur, double spred, double opacity, Color color = Colors.black}){
  return [
    BoxShadow(
        color: color.withOpacity(opacity),
        blurRadius: blur,
        spreadRadius: spred,
        offset: Offset(x, y),
    )
  ];
}

setBox(double i, double r) {
  return [
    BoxShadow(
      color: Colors.black,
      offset: Offset(i, i),
      blurRadius: r,
    )
  ];
}

setBox2(double i, double r) {
  return [
    BoxShadow(
      color: Colors.black,
      offset: Offset(i, -i),
      blurRadius: r,
    )
  ];
}

setIconShadow() {
  return [
    BoxShadow(
      color: Colors.grey[800],
      offset: Offset(2, 2),
      blurRadius: 2,
    )
  ];
}

screenWidth(BuildContext context){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
}

var clrFirst = fromHex("#7787A6");
var clrTow = fromHex("#D8E8F2");

var myThemeColor = [clrFirst, clrTow];

setGreadientColor() {
  return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: myThemeColor);
}

setsBox() {
  return BoxDecoration(
      boxShadow: setBoxShadow(fromHex("222222")),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
      color: Colors.black);
}

progressView(){
  return Center(
    child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(fromHex("#5872A6"))
    ),
  );
}

randomNumber(){
  return DateTime.now().millisecondsSinceEpoch;
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

Future<bool> checkInternet() async {
 await check().then((value) {
    if(value){
      //print(value);
      return value;
    } else{
      //print(value);
      return value;
    }
  });
}

String appVersion;

// versionInfo() {
//   PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
//     String appName = packageInfo.appName;
//     String packageName = packageInfo.packageName;
//     appVersion = packageInfo.version;
//     String buildNumber = packageInfo.buildNumber;
//   });
// }

potraitScreen(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

urlLauncher(urlText) async {
  var url = urlText;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

final Uri callUri = Uri(
    scheme: 'tel://');

dialCall({no}) async{
  var url = 'tel://$no';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


// final Uri feedbackUri = Uri(
//     scheme: 'mailto',
//     path: AppConstants.emailAddress,
//     queryParameters: {
//       'subject': '${AppConstants.appName} Feedback',
//       'body': "Name :- \nSuggestion :- \n Version :- "
//     });

class CustomClipPath extends CustomClipper<Path> {
  var radius=5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 75);
    path.quadraticBezierTo(
        size.width / 2, size.height,
        size.width, size.height - 75);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

getSize(indx,isleft){
  if (isleft) {
    var lt = ((indx == 1) ? 15.0 : 0.0);
    return lt;
  } else{
    var rt = ((indx == 0) ? 0.0 : 15.0);
    return rt;
  }
}

final Shader linearGradient = LinearGradient(
    colors: [fromHex("FF8489"), fromHex("D5ADC8")],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0,1.0]
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

TitleView(String title){
  return Container(
    margin: const EdgeInsets.only(left: 15.0,right: 15.0),
    child: new Text(title,style:
    TextStyle(
        fontFamily: AppFonts.primaryFont,
        fontSize: 24.0,
        fontWeight: FontWeight.w700, foreground: Paint()..shader = linearGradient
    )),
  );
}

BottomLineView(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 15,bottom: 14,top: 5),
    child: Container(
      width: (MediaQuery.of(context).size.width-30),
      height: 3.0,
      decoration: BoxDecoration(
          gradient: new LinearGradient(
              colors: [fromHex("FF8489"), fromHex("D5ADC8")],
              tileMode: TileMode.clamp,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.0,1.0]
          ),
          borderRadius: BorderRadius.circular(14.0)
      ),
    ),
  );
}

showToastMsg({String msg}){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

bool isLocal = false;

divider({double height, Color color}){
  return Container(
    height: height ?? 1,
    color: color ?? AppColors.greyColor,
  );
}
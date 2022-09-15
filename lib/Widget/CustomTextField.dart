import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/others/constants.dart';

class CustomTextField extends StatelessWidget {

  var icon;
  String hint;
  TextInputType keyBoardType;
  bool isEnable;
  TextEditingController controller;

  CustomTextField({this.icon, this.hint, this.isEnable = true, this.keyBoardType = TextInputType.text, this.controller});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15.0,
      ),
      height: 56.0,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 26.0,
            color: AppColors.primaryColor,
          ),
          SizedBox(width: 12,),
          Expanded(
            child: TextFormField(
              controller: controller,
              enabled: isEnable,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                border: InputBorder.none,
              ),
              keyboardType: keyBoardType,
            ),
          ),
          SizedBox(width: 12,),
        ],
      ),
    );
  }
}

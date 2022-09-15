import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/Controller/allControllers.dart';
import 'package:health_app/Widget/CustomButton.dart';
import 'package:health_app/Widget/CustomTextField.dart';
import 'package:health_app/others/constants.dart';
import 'package:health_app/routes.dart';
import 'package:intl/intl.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int selectedButton = 0;
  var dropdownValue = 'Male';
  UserController _userController = Get.put(UserController());

  genderDropDown() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15.0,
      ),
      height: 60.0,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(
            Icons.face_outlined,
            size: 25.0,
            color: Color(0xff409A64),
          ),
          SizedBox(width: 15),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration.collapsed(hintText: ''),
              value: dropdownValue,
              icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              itemHeight: 100,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  _userController.genderTEC.text = newValue;
                });
              },
              items: <String>['Male', 'Female']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

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
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              CustomTextField(
                controller: _userController.nameTEC,
                icon: Icons.account_circle_outlined,
                hint: 'Name',
              ),
              CustomTextField(
                controller: _userController.emailTEC,
                icon: Icons.mail_outline,
                hint: 'Email',
              ),
              InkWell(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1980),
                    lastDate: DateTime.now(),
                  ).then((date) {
                    if (date == null) {
                      return;
                    }
                    setState(() {
                      _userController.birthDateTEC.text = DateFormat('dd-MM-yyyy').format(date);
                    });
                  });
                },
                child: CustomTextField(
                  controller: _userController.birthDateTEC,
                  icon: Icons.cake_outlined,
                  hint: 'Birth Date',
                  isEnable: false,
                ),
              ),
              CustomTextField(
                controller: _userController.mobileTEC,
                icon: Icons.phone_outlined,
                hint: 'Mobile No.',
                keyBoardType: TextInputType.number,
              ),
              genderDropDown(),
              Row(
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                      height: 40,
                      text: "General",
                      bgColor: selectedButton == 0
                          ? AppColors.primaryColor
                          : Colors.white,
                      padding: 10,
                      fontSize: 16,
                      txtColor:
                          selectedButton == 0 ? Colors.white : Colors.black,
                      isBold: false,
                      onPressed: () {
                        selectedButton = 0;
                        setState(() {});
                      },
                    ),
                  ),
                  SizedBox(width: 30.0),
                  Expanded(
                    child: CustomButtonWidget(
                      height: 40,
                      text: "Health Workers",
                      bgColor: selectedButton == 1
                          ? AppColors.primaryColor
                          : Colors.white,
                      padding: 10,
                      fontSize: 16,
                      txtColor:
                          selectedButton == 1 ? Colors.white : Colors.black,
                      isBold: false,
                      onPressed: () {
                        selectedButton = 1;
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomButtonWidget(
                  height: 45,
                  text: "CONFIRM",
                  bgColor: AppColors.primaryColor,
                  padding: 10,
                  fontSize: 16,
                  txtColor: Colors.white,
                  onPressed: () {
                    Get.toNamed(Routes.otpScreen);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

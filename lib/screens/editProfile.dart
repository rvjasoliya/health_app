import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:health_app/Widget/CustomButton.dart';
import 'package:health_app/Widget/CustomTextField.dart';
import 'package:health_app/others/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../routes.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var isGeneral = true;
  var dropdownValue = 'Male';

  DateTime _selectDate;
  final nameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final birthDateTEC = TextEditingController();
  final genderTEC = TextEditingController();
  final addressTEC = TextEditingController();

  File _image;
  String imageName;
  final picker = ImagePicker();

  _showImagePickerOptions() {
    showMaterialModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (context, scrollController) => Container(
        height: 100.0,
        width: double.infinity,
        child: Column(
          children: [
            FlatButton(
              onPressed: () => pickImage(ImageSource.camera),
              child: Text(
                'Camera',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FlatButton(
              onPressed: () => pickImage(ImageSource.gallery),
              child: Text(
                'Gallery',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future pickImage(ImageSource imageSource) async {
    PickedFile pickedFile = await picker.getImage(source: imageSource);

    setState(
      () {
        if (pickedFile != null) {
          _image = File(pickedFile.path);
          GallerySaver.saveImage(_image.path).then(
            (path) {
              imageName = _image.path.split("/").last;
              setState(() {});
            },
          );
        }
      },
    );
    Navigator.of(context).pop();
  }

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Color(0xffEDF0F2),
        title: Text(
          'Edit Profile',
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
              InkWell(
                onTap: _showImagePickerOptions,
                child:
                _image == null ?
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text('Add Photo'),
                ):
                Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                            image: FileImage(
                              _image,
                            ),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              CustomTextField(
                controller: nameTEC,
                icon: Icons.account_circle_outlined,
                hint: 'Name',
              ),
              CustomTextField(
                controller: emailTEC,
                icon: Icons.mail_outline,
                hint: 'Email',
              ),
              InkWell(
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  ).then((date) {
                    if (date == null) {
                      return;
                    }
                    setState(() {
                      _selectDate = date;
                      birthDateTEC.text =
                          DateFormat('dd-MM-yyyy').format(_selectDate);
                    });
                  });
                },
                child: CustomTextField(
                  controller: birthDateTEC,
                  icon: Icons.cake_outlined,
                  hint: 'Birth Date',
                  isEnable: false,
                ),
              ),
              genderDropDown(),
              Container(
                margin: EdgeInsets.only(
                  bottom: 15.0,
                ),
                height: size.height * 0.17,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 25),
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
                    //Get.toNamed(Routes.otpScreen);
                    Get.back();
                  },
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

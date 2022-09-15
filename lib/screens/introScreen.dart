import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/Widget/CustomButton.dart';
import 'package:health_app/others/common.dart';
import 'package:health_app/others/constants.dart';
import 'package:health_app/routes.dart';

import '../others/constants.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  var sliderIndx = 0;

  introSlider(){
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: false,
          height: MediaQuery.of(context).size.height,
          onPageChanged: (index, reason) {
            sliderIndx = index;
            setState(() {
            });
          }
      ),
      items: sliderList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return i;
          },
        );
      }).toList(),
    );
  }

  var sliderList = [
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 10),
          child: Column(
            children: [
              Text('Each one of us has the power to help prevent the spread '
                  'of the Coronavirus pandemic in Cambodia.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              Text('Would you like to be kept informed if you have crossed paths '
                  'with someone who has tested COVID-19 positive?',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(height: 80,),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.intro1),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 10),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                      color: Colors.black
                  ),
                  children: <TextSpan> [
                    TextSpan(text: 'COVID Response App ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,),
                    ),
                    TextSpan(
                        text: 'tracks, through a Bluetooth & GPS generated social '
                            'graph, your interaction with someone who could have '
                            'tested COVID-19 positive.',
                        style: TextStyle(
                            fontSize: 14
                        )
                    ),
                  ],
                ),),
              SizedBox(height: 25,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  children: <TextSpan> [
                    TextSpan(text: 'Simply,\n ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,),
                    ),
                    TextSpan(
                      text: "1. ",
                    ),
                    TextSpan(text: 'Install ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,),
                    ),
                    TextSpan(
                      text: "the app\n",
                    ),
                    TextSpan(
                      text: "2. Switch on ",
                    ),
                    TextSpan(text: 'Bluetooth & GPS\n',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,),
                    ),
                    TextSpan(
                        text:
                        "3. Set "
                    ),
                    TextSpan(text: 'location sharing',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,),
                    ),
                    TextSpan(
                        text:
                        " to 'Always'\n\n "
                    ),
                    TextSpan(text: 'Invite your friends and family to install the app',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,),
                    ),
                  ],
                ),),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.intro4),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 10),
          child: Column(
            children: [
              Text('Tou will be alerted if someone you have come in close'
                  ' proximity of, even unknowingly, tests COVID-19 positive.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              Text('The app alerts are accompanied by instructions on how '
                  'to self-isolate and what to do in case you develop symptoms '
                  'that may need help and support.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(height: 70,),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.intro1),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48, left: 16, right: 16, bottom: 10),
          child: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'With ',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: <TextSpan> [
                    TextSpan(text: 'COVID Response App, ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,),
                    ),
                    TextSpan(
                        text: 'you can protect yourself, your family'
                            ' and friends, and help our country in the effort to fight COVID-19',
                        style: TextStyle(
                            fontSize: 14
                        )
                    ),
                  ],
                ),),
              SizedBox(height: 20,),
              Text('If we are safe, Cambodia is safe.',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),),
            ],
          ),
        ),
        SizedBox(height: 40,),
        CustomButtonWidget(
          height: 40,
          width: 180,
          bgColor: AppColors.primaryColor,
          text: "REGISTER NOW",
          txtColor: Colors.white,
          fontSize: 14,
          onPressed: () => Get.toNamed(Routes.loginPage),
        ),
        SizedBox(height: 40,),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.intro4),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          introSlider(),
          Positioned(
            bottom: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i =0; i<sliderList.length ;i++)
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: sliderIndx == i ? Colors.white : Colors.white38,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: Colors.white
                        ),
                      ),
                    ),
                  )
              ],
            ),
          )
        ],
      )
    );
  }
}
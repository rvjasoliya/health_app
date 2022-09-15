import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import 'package:health_app/Widget/DrawerWidget.dart';
import 'package:health_app/others/common.dart';
import 'package:health_app/others/constants.dart';
import 'package:health_app/routes.dart';
import 'package:health_app/screens/Health/healthStatus.dart';
import 'package:health_app/screens/Health/resourceScreen.dart';
import 'package:health_app/screens/Health/covidUpdate.dart';
import 'package:marquee/marquee.dart';
import 'package:system_setting/system_setting.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Health/newsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  int selectedTab = 0;
  TabController _tabController;
  BluetoothDevice device;
  BluetoothState state;
  BluetoothDeviceState deviceState;
  bool isBluPopOpen = false;

  List<Widget> _tabTwoParameters() => [
    Tab(
      text: "Health Status",
      icon: Image(
        image: AssetImage(AppIcons.icn_health),
        height: 24,
        width: 24,
        fit: BoxFit.cover,
        color: selectedTab == 0 ? AppColors.primaryColor : Colors.black,
      ),
    ),
    Tab(
      text: "Resources",
      icon: Image(
        image: AssetImage(AppIcons.icn_resource),
        height: 24,
        width: 24,
        fit: BoxFit.cover,
        color: selectedTab == 1 ? AppColors.primaryColor : Colors.black,
      ),
    ),
    Tab(
      text: "COVID Updates",
      icon: Image(
        image: AssetImage(AppIcons.icn_update),
        height: 24,
        width: 24,
        fit: BoxFit.cover,
        color: selectedTab == 2 ? AppColors.primaryColor : Colors.black,
      ),
    ),
    Tab(
      text: "News",
      icon: Image(
        image: AssetImage(AppIcons.icn_news),
        height: 24,
        width: 24,
        fit: BoxFit.cover,
        color: selectedTab == 3 ? AppColors.primaryColor : Colors.black,
      ),
    ),
  ];

  @override
  void initState() {
    // _tabController = TabController(vsync: this, length: _tabTwoParameters().length);
    // _tabController.addListener(() {
    //   selectedTab = _tabController.index;
    //   setState(() {
    //   });
    //   print("${_tabController.index}");
    // });
    FlutterBlue.instance.state.listen((state) {
      if (state == BluetoothState.off) {
        bluetoothDialog();
      } else if (state == BluetoothState.on) {
        if(isBluPopOpen){
          isBluPopOpen = false;
          Get.back();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: AppColors.primaryColor,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.icn_smallLogo),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
              },
              child: Icon(
                Icons.share,
                color: Colors.white,
                size: 24.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showToastMsg(msg: "Coming Soon!!");
              },
              child: Image(
                image: AssetImage(AppIcons.icn_language),
                width: 28,
                height: 28,
              ),
            ),
          ),
          SizedBox(width: 8,)
        ],
      ),
      drawer: DrawerWidget(),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Breaking News: ", style: TextStyle(
                      color: AppColors.redColor,
                      fontSize: 9
                  ),),
                  Expanded(
                    child: Marquee(
                      text: "Cambodia's COVID-19 tally increases to 290 barely 48 hours after Prime Minister..."
                          "Hun Sen warned of the resurgence of the deadly virus",
                      scrollAxis: Axis.horizontal,
                      style: TextStyle(
                          fontSize: 9,
                        color: Colors.black
                      ),
                      blankSpace: 20.0,
                      velocity: 40,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      color: Colors.white,
                      child: TabBar(
                        tabs: _tabTwoParameters(),
                        labelColor: AppColors.primaryColor,
                        labelPadding: EdgeInsets.symmetric(vertical: 0),
                        labelStyle: TextStyle(fontSize: 12),
                        unselectedLabelColor: Colors.black,
                        indicatorColor: AppColors.primaryColor,
                        indicatorWeight: 3,
                        onTap: (index){
                          selectedTab = index;
                          setState(() {
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TabBarView(
                          controller: _tabController,
                            children: [
                          HealthStatus(tabController: _tabController,),
                          ResourceScreen(),
                          CovidUpdate(),
                          NewsScreen(),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bluetoothDialog(){
    isBluPopOpen = true;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            child: Container(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.bgColor,
                    height: 60,
                    child: Center(
                      child: Image(
                          height: 40,
                          width: 40,
                          image: AssetImage(AppIcons.icn_bluetooth)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Turn on Bluetooth',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Bluetooth must be on at all times to'
                          ' track your proximity to other devices and give you '
                          'accurate safety updates.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              SystemSetting.goto(SettingTarget.BLUETOOTH);
                            },
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors.primaryColor,
                              ),
                              child: Text(
                                'TURN ON',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                'CANCEL',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  correctAnswerDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              height: 220,
              child: Column(
                children: [
                  Text(
                    'Please give correct answers',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Accurate answers help us - '
                        'help you better. Medical and support staff are valuable and '
                        'very limited. Be a responsible citizen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: 130,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: AppColors.primaryColor,
                      ),
                      child: Text(
                        'Ok, Got it',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

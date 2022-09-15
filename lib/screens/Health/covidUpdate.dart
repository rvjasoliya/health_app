import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/Widget/SegmentController.dart';
import 'package:health_app/screens/Health/chartView.dart';
import 'package:health_app/others/common.dart';
import 'package:health_app/others/constants.dart';

class CovidUpdate extends StatefulWidget {
  @override
  _CovidUpdateState createState() => _CovidUpdateState();
}

class _CovidUpdateState extends State<CovidUpdate>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _currentIndex = 0;

  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("New", style: TextStyle(
      fontSize: 10
    ),),
    1: Text("Total", style: TextStyle(
        fontSize: 10
    ),)
  };

  int _index = 0;

  @override
  void initState() {
    super.initState();
    _tabController =
    new TabController(vsync: this, length: 2, initialIndex: _currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  caseCount({title, count, color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          count,
          style: TextStyle(
            fontSize: 24,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: AppColors.bgColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 25, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COVID-19 Cases Overview',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Updated 1 hour, 11 minutes age. 20 Oct '20",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0,1),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Across Cambodia',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: caseCount(
                                  title: 'Active',
                                  count: '10',
                                  color: AppColors.redColor),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: caseCount(
                                  title: 'Recovered',
                                  count: '283',
                                  color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: caseCount(
                                  title: 'Deceased',
                                  count: '50',
                                  color: Colors.black),
                            ),
                            SizedBox(width: 15,),
                            Expanded(
                              child: caseCount(
                                  title: 'Confirmed',
                                  count: '290',
                                  color: AppColors.redColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Cases over time',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cambodia',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                      Container(
                        width: 100,
                        child: SegmentedWidget(
                          onChanged: (i) {
                            setState(() => _index = i);
                          },
                          index: _index,
                          color: AppColors.primaryColor,
                          children: [
                            Text("New", style: TextStyle(
                                fontSize: 10
                            ),),
                            Text("Total", style: TextStyle(
                                fontSize: 10
                            ),),
                          ]
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: size.height * 0.32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0,1),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: ChartView(),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Each day shows new cases reposted since the previous day Updated yesterday',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              color: AppColors.primaryColor,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(AppIcons.icn_call),
                            width: 22,
                            height: 22,
                          ),
                          SizedBox(width: 5,),
                          Text("Call Helpline", style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),),
                        ],
                      ),
                      onTap: (){
                        dialCall(no: "115");
                      },
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 1,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(AppIcons.icn_assess),
                            width: 22,
                            height: 22,
                          ),
                          SizedBox(width: 5,),
                          Text("Assess Again", style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),),
                        ],
                      ),
                      onTap: (){
                        showToastMsg(msg: "Coming Soon!!");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
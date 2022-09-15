import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/others/common.dart';
import 'package:health_app/others/constants.dart';
import 'package:health_app/routes.dart';

class HealthStatus extends StatelessWidget {

  TabController tabController;
  HealthStatus({this.tabController});

  var imgList = [AppImages.healthBanner4, AppImages.healthBanner4, AppImages.healthBanner4,];

  imageSlider(){
    return CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 1,
          aspectRatio: 3,
          autoPlay: true,
      ),
      items: imgList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(i),
                    fit: BoxFit.cover
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(AppIcons.icn_profile),
                    width: 42,
                    height: 42,
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You are Safe", style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),),
                        SizedBox(height: 3,),
                        Text("Contact tracing", style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    size: 18,
                  )
                ],
              ),
            ),
            onTap: (){
              showToastMsg(msg: "Coming Soon!!");
            },
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Trending Now", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
                SizedBox(height: 10,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 170,
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.videoBanner),
                            fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black12, Colors.black54]
                            )
                          ),
                          child: Icon(
                            Icons.play_circle_outline_rounded,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text("#MaskForce | Join the FIght!", style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              clipBehavior: Clip.antiAlias,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.videoBanner),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Colors.black12, Colors.black54]
                                    )
                                ),
                                child: Icon(
                                  Icons.play_circle_outline_rounded,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text("108 - Cambodia's Response to COVD-19", style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              clipBehavior: Clip.antiAlias,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(AppImages.videoBanner),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [Colors.black12, Colors.black54]
                                    )
                                ),
                                child: Icon(
                                  Icons.play_circle_outline_rounded,
                                  color: Colors.white,
                                  size: 36,
                                ),
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text("Cambodia's COVD-19 Response", style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 40,
                      width: 150,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("SEE ALL", style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),),
                          SizedBox(width: 5,),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.primaryColor,
                            size: 16,
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      showToastMsg(msg: "Coming Soon!!");
                      // print(tabController);
                      // tabController.animateTo(1);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Useful Resources", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
                SizedBox(height: 10,),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(AppImages.healthBanner1),
                      fit: BoxFit.cover
                    ),
                    boxShadow: setWidgetShadow(
                      x: 0,
                      y: 1,
                      color: Colors.grey,
                      blur: 3,
                      spred: 0,
                      opacity: 1
                    )
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: AssetImage(AppImages.healthBanner2),
                          fit: BoxFit.cover
                      ),
                      boxShadow: setWidgetShadow(
                          x: 0,
                          y: 1,
                          color: Colors.grey,
                          blur: 3,
                          spred: 0,
                          opacity: 1
                      )
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: AssetImage(AppImages.healthBanner3),
                          fit: BoxFit.cover
                      ),
                      boxShadow: setWidgetShadow(
                          x: 0,
                          y: 1,
                          color: Colors.grey,
                          blur: 3,
                          spred: 0,
                          opacity: 1
                      )
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Image(
                        image: AssetImage(AppIcons.icn_quote),
                        width: 80,
                        height: 80,
                        color: fromHex("DFE9F5"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 35),
                        child: Text("COVID Response App is important step towards "
                            "our fight against COVID-19.\n\n With the help of ITC we can "
                            "get the real time information of COVID-19 infected peoples "
                            "and patients which will help to do the contact tracing.", style: TextStyle(
                          fontSize: 12,
                        ),),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                ProfileSlider(),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Useful Resources", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
                SizedBox(height: 10,),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: (MediaQuery.of(context).size.width ) / 1.5,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(imgList[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
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
                      //showToastMsg(msg: "Coming Soon!!");
                      Get.toNamed(Routes.qnaScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileSlider extends StatefulWidget {
  @override
  _ProfileSliderState createState() => _ProfileSliderState();
}

class _ProfileSliderState extends State<ProfileSlider> {

  var sliderIndx = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 4.5,
              autoPlay: true,
              onPageChanged: (index, reason) {
                sliderIndx = index;
                setState(() {
                });
              }
          ),
          items: [1,2,3].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(AppIcons.icn_profile),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hun Sen", style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),),
                            SizedBox(height: 5,),
                            Text("Hon'ble Prime Minister of Kingdom of Cambodia", style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int i =0; i<3;i++)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image(
                  image: AssetImage(i == sliderIndx ? AppIcons.icn_radio_s : AppIcons.icn_radio),
                  width: 10,
                  height: 10,
                ),
              )
          ],
        )
      ],
    );
  }
}

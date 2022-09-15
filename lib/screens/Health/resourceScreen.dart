import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_app/others/common.dart';
import 'package:health_app/others/constants.dart';

class ResourceScreen extends StatelessWidget {

  var imgList = [AppImages.rsBanner1, AppImages.rsBanner1, AppImages.rsBanner1,];

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
          SizedBox(height: 8,),
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
                              color: Colors.black,
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
                              color: Colors.black,
                              fontSize: 14,
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Protect yourself and others from getting sick", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),
                SizedBox(height: 10,),
                Container(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(imgList[index]),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        clipBehavior: Clip.antiAlias,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppImages.logo),
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
                                  colors: [Colors.black54, Colors.black54]
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
                      Text("COVID-19 Stop the Spread of Germs", style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      SizedBox(height: 3,),
                      Text("Help stop the spread of COVID-19 and other "
                          "respiratory illnesses by following these steps.", style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("What WHO Say's", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),),
                SizedBox(height: 10,),
                divider(height: 0.3,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text("#HealthyATHome", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                      SizedBox(height: 10,),
                      Container(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(AppImages.food),
                                              fit: BoxFit.cover,
                                          ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      left: 0,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                        color: Colors.black54,
                                        child: Text("Healthy ATHome", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text("Be ready", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),),
                      SizedBox(height: 10,),
                      Container(
                        height: 170,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Container(
                                width: (MediaQuery.of(context).size.width - 50) / 2,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: AssetImage(AppImages.rsBanner2),
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
    );
  }
}

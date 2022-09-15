import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/others/common.dart';
import 'package:health_app/others/constants.dart';

import '../routes.dart';

class DrawerWidget extends StatelessWidget {

  getDrawerItem({icon, title, subtitle, index}) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24, color: Colors.grey),
            SizedBox(width: 25),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        dialCall(no: "115");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              child: DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image(
                        image: AssetImage(AppIcons.icn_profile),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10.0,
                          right: 10.0,
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'John Doe',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '+919966330033',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Icon(Icons.edit_outlined, size: 20),
                      onTap: (){
                        Get.back();
                        Get.toNamed(Routes.editProfile);
                      },
                    ),
                  ],
                ),
              ),
            ),
            getDrawerItem(
              icon: Icons.call_outlined,
              title: 'Call Helpline (115)',
              subtitle: 'Health ministry toll-free helpline for queries related to COVID-19',
              index: 1,
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: InkWell(
                    onTap: () {
                      Get.back();
                      Get.toNamed(Routes.webViewLoad, arguments: {'title':"Privacy Policy", 'link':''});
                    },
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: fromHex("#4081DC"),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                child: InkWell(
                  onTap: () {
                    Get.back();
                    Get.toNamed(Routes.webViewLoad, arguments: {'title':"Terms of Use", 'link':''});
                  },
                  child: Text(
                    'Terms of Use',
                    style: TextStyle(color: fromHex("#4081DC")),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

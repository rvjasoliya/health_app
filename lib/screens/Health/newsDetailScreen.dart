import 'package:flutter/material.dart';
import 'package:health_app/Model/NewsModel.dart';
import 'package:health_app/others/constants.dart';

class NewsDetailScreen extends StatelessWidget {

  NewsModel news;
  NewsDetailScreen({this.news});

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
              onTap: () {},
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
              onTap: () {},
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
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(10),
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(news.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    news.subtext,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    news.description,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      height: 1.6,
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

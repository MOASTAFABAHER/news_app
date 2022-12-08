import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/app_colors.dart';

class ShowScreen extends StatelessWidget {
  String? imageUrl;
  String? description;
  String? date;
  String? title;
  String? state;

  ShowScreen(
      {required this.imageUrl,
      required this.title,
      this.date,
      this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.krwhiteColor,
        title: Text('News App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(imageUrl == null
                        ? 'https://st3.depositphotos.com/23594922/31822/v/600/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg'
                        : imageUrl!),
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                date!,
                style: TextStyle(
                    color: AppColors.krgreyColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w200),
              ),
            ),
            SizedBox(
              height: 100.h,
              child: Expanded(
                child: Text(
                  title!,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w900,
                      color: AppColors.krBlackColor),
                ),
              ),
            ),
            Expanded(
              child: Text(
                description == null ? 'No description' : description!,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

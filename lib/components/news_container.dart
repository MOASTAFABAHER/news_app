import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/show_screen.dart';
import 'package:news_app/utils/app_navigator.dart';

class NewsContainer extends StatelessWidget {
  String? title;
  String? date;
  String? imageUrl;
  String? description;
  NewsContainer(
      {required this.title,
      required this.date,
      required this.imageUrl,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          AppNavigator.appNavigator(
              context,
              ShowScreen(
                imageUrl: imageUrl,
                title: title!,
                date: date,
                description: description,
              ));
        },
        child: Row(
          children: [
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl.toString()),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: SizedBox(
                height: 120.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '$title',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '$date',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}

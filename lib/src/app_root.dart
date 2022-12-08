import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/app_colors.dart';
import 'package:news_app/screens/news_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({Key? key}) : super(key: key);

  @override
  ScreenUtilInit build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: AppColors.krorangeColor,
            scaffoldBackgroundColor: AppColors.krwhiteColor,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: AppColors.krBlackColor),
                systemOverlayStyle:
                    const SystemUiOverlayStyle(statusBarColor: Colors.white),
                color: AppColors.krwhiteColor,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: AppColors.krBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 0,
              backgroundColor: AppColors.krwhiteColor,
              selectedItemColor: AppColors.krorangeColor,
              type: BottomNavigationBarType.fixed,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const NewsScreen(),
        );
      },
    );
  }
}

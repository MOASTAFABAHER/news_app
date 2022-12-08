import 'package:flutter/cupertino.dart';
import 'package:news_app/service/dio_helper/dio_helper.dart';
import 'package:news_app/src/app_root.dart';

void main() {
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AppRoot());
}

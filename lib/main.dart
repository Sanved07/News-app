import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';

import 'Screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      allowFontScaling: true,
      child: MaterialApp(
        title: 'Flutter News App',
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primaryColor: Colors.black),
        home: SplashScreen(),
      ),
    );
  }
}

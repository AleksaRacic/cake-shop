import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.8, 0.9, 1.0],
              colors: [
                Color(0xFFFFFFFF), // Your gradient's start color
                Color(0xFFF187B3), // Your gradient's middle color
                Colors.white,
                Colors.white, // This ensures the bottom 50 pixels are white
              ],
            ),
          ),
          child: MaterialApp(
            theme: theme, // Ensure 'theme' is defined
            title: 'slatkizalogaj',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.loginScreen,
            routes: AppRoutes.routes,
          ),
        );
      },
    );
  }
}

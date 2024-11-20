import 'package:flutter/material.dart';
import 'package:projeto_2/HomePage.dart';
import 'package:projeto_2/appController.dart';
import 'package:projeto_2/loginPage.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.red,
              brightness: AppController.instance.isDarkTheme
                  ? Brightness.dark
                  : Brightness.light
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Loginpage(),
            '/home': (context) => HomePage(),
          },
        );
      },
    );
  }
}

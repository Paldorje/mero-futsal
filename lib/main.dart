import 'dart:io';

import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
void main() {
  runApp(MeroFutsal());
  HttpOverrides.global = MyHttpOverrides();
}

// ignore: use_key_in_widget_constructors
class MeroFutsal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF282638),
        scaffoldBackgroundColor: const Color(0xFF282638),
      ),
      home: AnimatedIntroductionSlider(),
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
void main() => runApp(MeroFutsal());

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

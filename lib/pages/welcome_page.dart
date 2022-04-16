import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:mero_futsal/components/introduction_pages.dart';
import 'package:mero_futsal/pages/users_page.dart';

class AnimatedIntroductionSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mero Futsal', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapSkipButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsersPage(),
              ),
            );
          },
          doneText: Text(
            'LETS GET STARTED',
            style: TextStyle(
              color: Colors.red.shade800,
              fontSize: 13.0,
            ),
          ),
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsersPage(),
              ),
            );
          },
          pageButtonTextStyles: const TextStyle(
            color: Colors.blue,
            fontSize: 16.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}

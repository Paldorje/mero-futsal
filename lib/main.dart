import 'dart:io';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/localization/khalti_localizations.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const MeroFutsal());
  HttpOverrides.global = MyHttpOverrides();
}

class MeroFutsal extends StatelessWidget {
  const MeroFutsal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF282638),
        scaffoldBackgroundColor: const Color(0xFF282638),

      ),
        localizationsDelegates: const [
          KhaltiLocalizations.delegate,
        ],
      home: const AnimatedIntroductionSlider(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

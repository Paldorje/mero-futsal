import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'khalti_payment_page.dart';
import 'package:khalti_flutter/localization/khalti_localizations.dart';

class KhaltiPayment extends StatelessWidget {
  const KhaltiPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
        publicKey: "test_public_key_69f87a4a884a48bfbc6750d79299466f",
        builder: (context, navigatorKey) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
            theme: ThemeData(
                primaryColor: const Color.fromRGBO(40, 38, 56, 1),
                appBarTheme: const AppBarTheme(
                  color: Color.fromRGBO(40, 38, 56, 1),
                )),
            title: 'Khalti Payment',
            home: KhaltiPaymentPage(),
          );
        });
  }
}
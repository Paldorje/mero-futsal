import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'khalti_payment_page.dart';

class KhaltiPayment extends StatefulWidget {
  const KhaltiPayment({Key? key}) : super(key: key);

  @override
  State<KhaltiPayment> createState() => _KhaltiPaymentState();
}

class _KhaltiPaymentState extends State<KhaltiPayment> {

  @override
  Widget build(BuildContext context) {
    final config = PaymentConfig(
      amount: 10000, // Amount should be in paisa
      productIdentity: 'dell-g5-g5510-2021',
      productName: 'Dell G5 G5510 2021',
      productUrl: 'https://www.khalti.com/#/bazaar',
      additionalData: { // Not mandatory; can be used for reporting purpose
        'vendor': 'Khalti Bazaar',
      },
    );
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
            home: KhaltiButton(
              config: config,
              preferences: [ // Not providing this will enable all the payment methods.
                PaymentPreference.khalti,
                // PaymentPreference.eBanking,
              ],
              onSuccess: (successModel) {
                // Perform Server Verification
              },
              onFailure: (failureModel) {
                // What to do on failure?
              },
              onCancel: () {
                // User manually cancelled the transaction
              },
            ),
          );
        });
  }
}
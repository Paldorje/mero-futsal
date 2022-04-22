import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class KhaltiPaymentPage extends StatefulWidget {
  const KhaltiPaymentPage({Key? key}) : super(key: key);

  @override
  State<KhaltiPaymentPage> createState() => _KhaltiPaymentPageState();
}

class _KhaltiPaymentPageState extends State<KhaltiPaymentPage> {
  TextEditingController amountController = TextEditingController();

  getAmt() {
    return int.parse(amountController.text) * 100; // Converting to paisa
  }


  @override
  void initState() {
    super.initState();
  }

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Khalti Payment Integration'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 15),
            // For Amount
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: "Enter Amount to pay",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  )),
            ),
            const SizedBox(
              height: 8,
            ),

            KhaltiButton(
              config: config,
              preferences: [ // Not providing this will enable all the payment methods.
                PaymentPreference.khalti,
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
            // For Button
            // MaterialButton(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8),
            //         // side: const BorderSide(color: Colors.red),
            //     ),
            //     height: 50,
            //     color: const Color.fromRGBO(40, 38, 56, 1),
            //     child: const Text(
            //       'Pay With Khalti',
            //       style: TextStyle(color: Colors.white, fontSize: 22),
            //     ),
            //     onPressed: () {
            //       KhaltiScope.of(context).pay(
            //         config: PaymentConfig(
            //           amount: getAmt(),
            //           productIdentity: 'Futsal-1',
            //           productName: 'Sherpa Futsal',
            //         ),
            //         preferences: [
            //           PaymentPreference.khalti,
            //         ],
            //         onSuccess: (su) {
            //           const successesBar =
            //           SnackBar(
            //             content: Text('Payment Successful'),
            //           );
            //           ScaffoldMessenger.of(context)
            //               .showSnackBar(successesBar);
            //         },
            //         onFailure: (fa) {
            //           const failedSnackBar = SnackBar(
            //             content: Text('Payment Failed'),
            //           );
            //           ScaffoldMessenger.of(context)
            //               .showSnackBar(failedSnackBar);
            //         },
            //         onCancel: () {
            //           const cancelSnackBar = SnackBar(
            //             content: Text('Payment Cancelled'),
            //           );
            //           ScaffoldMessenger.of(context)
            //               .showSnackBar(cancelSnackBar);
            //         },
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
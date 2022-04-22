import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/models/cart_model.dart';
import 'package:mero_futsal/pages/khalti.dart';
import 'package:mero_futsal/pages/PlayerPages/player_home_page.dart';
import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
DateFormat format = DateFormat("yyyy-MM-dd ");

class CheckoutPage extends StatefulWidget {
  final CartModel cartModel;

  const CheckoutPage({Key? key, required this.cartModel}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}


class _CheckoutPageState extends State<CheckoutPage> {
  var isloading = false;

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: bleu,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.chevron_left,
                size: 40,
              ),
            ),
          ),
        ),
        body: Container(
          color: bleu,
          width: _screenwidth,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: ClipPath(
                    clipper: MovieTicketClipper(),
                    child: Container(
                      color: white,
                      width: _screenwidth * .8,
                      height: _screenheight * .7,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/checkout.png',
                              width: 100,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Your Bill',
                              style: style.copyWith(
                                  color: Colors.black, fontSize: 20),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                widget.cartModel.name,
                                style: style.copyWith(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                    'Booked Time: ' + dateFormat.format(widget.cartModel.bookedTime),
                                    style: style.copyWith(
                                        fontSize: 12, color: Colors.black),
                                  ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Booked Date: ' + format.format(widget.cartModel.bookedTime),
                                style: style.copyWith(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              indent: 10,
                              endIndent: 10,
                              thickness: 1,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                'Rs: ' + widget.cartModel.price.toString(),
                                style: style.copyWith(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: const [
                                    Text('2022 © MeroFutsal'),
                                  ],
                                )),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildbutton(_screenheight, _screenwidth),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildbutton(double _screenheight, _screenwidth) {
    return Expanded(
      child: Container(
        width: _screenwidth * .6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white),
        child: MaterialButton(
            child: Text(
              'Pay Now',

              style: style.copyWith(fontSize: 18, color: Colors.red),
            ),
          onPressed: () {
            setState(() {
              isloading = true;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KhaltiPayment()));
            });
            //   Future.delayed(const Duration(seconds: 3)).then((value) {
            //     setState(() {
            //       isloading = false;
            //     });
            //     _buildawesomedialog();
            //   });
            // },
            // child: (isloading)
            //     ? const CircularProgressIndicator()
            //     :
          })
        ),
      );
  }

  _buildawesomedialog() {
    return AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.SUCCES,
            title: 'Success Payment',
            btnOkText: 'OK',
            btnOkIcon: Icons.check,
            dismissOnBackKeyPress: false,
            btnOkOnPress: () {
              bookedGround.clear();
              // total = 0.0;
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const MyHomePage(userEmail: 'idk',)));
            },
            btnOkColor: Colors.green,
            buttonsBorderRadius: BorderRadius.circular(20))
        .show();
  }

  Widget _builditems(
      {required String name, required int price, required int items}) {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Text(
            items > 1 ? '$name * $items' : name,
            style: style.copyWith(fontSize: 12, color: Colors.black),
          ),
          const Spacer(),
          Text(
            'Rs $price',
            style: style.copyWith(fontSize: 12, color: Colors.black),
          )
        ],
      ),
    );
  }
}

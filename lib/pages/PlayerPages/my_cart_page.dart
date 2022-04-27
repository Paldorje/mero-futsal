import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/models/cart_model.dart';
import 'package:mero_futsal/pages/checkout_page.dart';
import 'package:intl/intl.dart';

import 'booking_history.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd");

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              size: 30,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'My Bookings',
            style: style.copyWith(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:[ bookedGround.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: _screenHeight * .7,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: bookedGround.length,
                                itemBuilder: (context, index) {
                                  return index % 2 == 0
                                      ? BounceInLeft(
                                          child: _buildcartitem(index: index))
                                      : BounceInRight(
                                          child: _buildcartitem(index: index));
                                })),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        'Nothing To Show',
                        style: style.copyWith(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: _screenWidth * .4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pink),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => BookingHistory()));
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.history, color: Colors.white,),
                                const Spacer(),
                                Text(
                                  'View My Booking History',
                                  style: style.copyWith(
                                      color: white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                )
                ],
            )),
      ),
    );
  }

  Widget _buildcartitem({required int index}) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (dir) {
        setState(() {
          // total = total - bookedGround[index].price;
          bookedGround.remove(bookedGround[index]);
        });
      },
      background: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(
          Icons.delete,
          color: white,
          size: 40,
        ),
        alignment: Alignment.centerLeft,
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey,
                offset: Offset(0, 10),
              ),
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Image.asset(
                  'assets/images/two.png',
                  fit: BoxFit.cover,
                  width: 110,
                  height: 85,
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage(cartModel:bookedGround[index])));},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Futsal Name: ' + bookedGround[index].name,
                      maxLines: 1,
                      style: style.copyWith(fontSize: 16, color: Colors.black),
                    ),
                    Text(
                      'Price: Rs ${bookedGround[index].price}',
                      maxLines: 1,
                      style: style.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Text(
                      'Booked Time: '
                        + DateFormat.jm().format(bookedGround[index].bookedTime),
                      style: style.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),

                    Text(
                      'Booked Date: '
                          + dateFormat.format(bookedGround[index].bookedTime),
                      style: style.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


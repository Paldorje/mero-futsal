import 'package:flutter/material.dart';
import 'package:mero_futsal/components/booking_calendar.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/models/cart_model.dart';
import 'package:mero_futsal/models/futsal_arenas.dart';
import 'package:mero_futsal/pages/map.dart';

class DetailsPage extends StatefulWidget {
  final FutsalArenas item;

  const DetailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    var _screenHeight = MediaQuery.of(context).size.height;
    var _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(.5),
                Colors.black.withOpacity(.0),
              ],
              begin: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              _buildUpperPart(
                  screenWidth: _screenWidth, screenHeight: _screenHeight),
              _buildBottomPart(_screenHeight),
            ],
          )),
    );
  }

  Container buildTextButton(BuildContext context) {
    return Container(
      height: 40,
      width: 500,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.red),
      child: MaterialButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapScreen()),
        ),
        child: const Text(
          'Find location on Map',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Expanded _buildBottomPart(double _screenHeight) {
    return Expanded(
        child: Container(
      color: white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.item.futsalName,
              style: style.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Price: Rs ${widget.item.cost}',
              style: style.copyWith(fontSize: 17, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),

            Text(
              'Location: ${widget.item.location}',
              style: style.copyWith(fontSize: 17, color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            buildTextButton(context),
            const SizedBox(
              height: 10,
            ),
            _buildButton(_screenHeight)
          ],
        ),
      ),
    ));
  }

  Flexible _buildButton(double _screenHeight) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        height: _screenHeight * .08,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: MaterialButton(
          onPressed: () {
            if (bookedGround
                .map((item) => item.name)
                .contains(widget.item.futsalName)) {
              final snackBar = SnackBar(
                  backgroundColor: Colors.teal,
                  duration: const Duration(seconds: 2),
                  content: Text(
                    'You have already booked ground from this futsal.',
                    style: style.copyWith(fontSize: 14, color: Colors.white),
                  ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BookingCalendarPage()));
              // bookedGround.add(
              //   CartModel(
              //     name: widget.item.futsalName,
              //     price: widget.item.cost,
              //     // img: widget.item.img,
              //     color: Colors.red,
              //     items: 1,
              //     size: 6,
              //   ),
              // );
              // total = total + widget.item.cost;
              // Navigator.pop(context);
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.backpack,
                color: white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Book',
                style: style.copyWith(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpperPart(
      {required var screenWidth, required var screenHeight}) {
    return Container(
      width: screenWidth,
      height: screenHeight * .6,
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: white,
                    size: 40,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.item.isReserved = !widget.item.isReserved;

                      widget.item.isReserved
                          ? favouriteArenas.add(widget.item)
                          : favouriteArenas.remove(widget.item);
                    });
                  },
                  child: Icon(
                    Icons.favorite_sharp,
                    color: widget.item.isReserved ? Colors.red : white,
                    size: 30,
                  ),
                )
              ],
            ),
            Center(
              child: Image.asset(
                'assets/images/one.png',
                width: 450,
                height: 355,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _timing() {
  //   return SizedBox(
  //     height: 60,
  //     width: 400,
  //     child: GestureDetector(
  //       onTap: () {
  //         setState(() {});
  //       },
  //       child: Container(
  //         height: 40,
  //         width: 500,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(8), color: Colors.red),
  //         child: MaterialButton(
  //             onPressed: () => Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const BookingCalendarPage()),
  //                 ),
  //             child: const Text(
  //               'Pick Date',
  //               style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold),
  //             )),
  //       ),
  //     ),
  //   );
  // }
}

import 'package:flutter/material.dart';
import 'package:mero_futsal/components/booking_calendar.dart';
import 'package:mero_futsal/models/cart_model.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/models/futsal_arenas.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;
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
              _buildupperpart(
                  screenwidth: _screenwidth, screenheight: _screenheight),
              TextButton
                (
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed:() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MapScreen()),) ,
                                    child: Text('Location')),
              _buildbottompart(_screenheight),

            ],
          )),
    );
  }

  Expanded _buildbottompart(double _screenheight) {
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
                  widget.item.name,
                  style: style.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Text(
                //   'Choose a date and time',
                //   style: style.copyWith(
                //       fontWeight: FontWeight.w100,
                //       fontSize: 18,
                //       color: Colors.black),
                // ),
                const SizedBox(
                  height: 20,
                ),
                _timing(),
                const SizedBox(
                  height: 30,
                ),
                _buildbutton(_screenheight)
              ],
            ),
          ),
        ));
  }

  Flexible _buildbutton(double _screenheight) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        height: _screenheight * .08,
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: widget.item.color),
        child: MaterialButton(
          onPressed: () {
            if (bookedGround
                .map((item) => item.name)
                .contains(widget.item.name)) {
              final snackBar = SnackBar(
                  backgroundColor: Colors.teal,
                  duration: const Duration(seconds: 2),
                  content: Text(
                    'You have already booked ground from this futsal.',
                    style: style.copyWith(fontSize: 14, color: Colors.white),
                  ));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              bookedGround.add(
                CartModel(
                  name: widget.item.name,
                  price: widget.item.price,
                  img: widget.item.img,
                  color: widget.item.color,
                  items: 1,
                  size: 6,
                ),
              );
              total = total + widget.item.price;
              Navigator.pop(context);
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

  Widget _buildupperpart(
      {required var screenwidth, required var screenheight}) {
    return Container(
      width: screenwidth,
      height: screenheight * .6,
      decoration: BoxDecoration(
          color: widget.item.color,
          borderRadius: const BorderRadius.only(
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
                      widget.item.isselected = !widget.item.isselected;

                      widget.item.isselected
                          ? favouriteArenas.add(widget.item)
                          : favouriteArenas.remove(widget.item);
                    });
                  },
                  child: Icon(
                    Icons.favorite_sharp,
                    color: widget.item.isselected ? Colors.red : white,
                    size: 30,
                  ),
                )
              ],
            ),
            Center(
              child: Image.asset(
                widget.item.img,
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

  Widget _timing() {
    return SizedBox(
        height: 60,
        width: 400,
      child: GestureDetector(
        onTap: () {
          setState(() {
          });
        },
        child: Container(
          height: 40,
          width: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: widget.item.color
          ),
          child: MaterialButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => BookingCalendarPage()),) ,


                // DatePicker.showDateTimePicker(context,
                //     showTitleActions: true,
                //     minTime: DateTime.now(),
                //     maxTime: DateTime(2022, 3, 30), onChanged: (date) {
                //       print('change $date');
                //     }, onConfirm: (date) {
                //       print('confirm $date');
                //     }, currentTime: DateTime.now(), locale: LocaleType.en);
              // },
              child:
              Text(
                'Pick Date',
                style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
              )),
        ),
      ),
    );
  }
}
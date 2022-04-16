import 'package:flutter/material.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/models/cart_model.dart';
import 'package:mero_futsal/models/futsal_arenas.dart';

class EditDetailsPage extends StatefulWidget {
  final FutsalArenas item;

  const EditDetailsPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
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
              _buildbottompart(_screenheight)
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
              widget.item.futsalName,
              style: style.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Manage Time',
              style: style.copyWith(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                  color: Colors.black),
            ),
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
          borderRadius:
              BorderRadius.circular(10), /** color: widget.item.color**/
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
              bookedGround.add(
                CartModel(
                  name: widget.item.futsalName,
                  price: widget.item.cost,
                  // img: widget.item.img,
                  color: Colors.red,
                  items: 1,
                  size: times[value],
                ),
              );
              total = total + widget.item.cost;
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
                'Edit',
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
          // color: widget.item.color,
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
              ],
            ),
            Center(
              child: Image.asset(
                // widget.item.img,
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

  Widget _timing() {
    return SizedBox(
        height: 40,
        width: 500,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            _timingitem(index: 0, title: times[0]),
            _timingitem(index: 1, title: times[1]),
            _timingitem(index: 2, title: times[2]),
            _timingitem(index: 3, title: times[3]),
            _timingitem(index: 4, title: times[4]),
          ],
        ));
  }

  Widget _timingitem({required int index, required int title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: GestureDetector(
        onTap: () {
          setState(() {
            value = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: value == index ? widget.item.color : Colors.transparent,
          ),
          child: Center(
              child: Text(
            title.toString(),
            style: style.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: value == index ? Colors.white : Colors.black,
            ),
          )),
        ),
      ),
    );
  }
}

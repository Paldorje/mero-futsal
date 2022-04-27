import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/models/api.services.dart';

import '../../models/bookings.dart';
import '../../models/user.dart';


import 'package:intl/intl.dart';

DateFormat dateFormat = DateFormat("yyyy-MM-dd");

class MyBookings extends StatefulWidget {
  const MyBookings({Key? key}) : super(key: key);

  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  var index = 0;

  @override
  Widget build(BuildContext context) {
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
          child: FutureBuilder(
              future: APIServices.fetchBookingsByFutsal(2),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data);
                  List<Bookings> allBookings = snapshot.data;
                  print(allBookings);
                  if (allBookings.isEmpty) {
                    return Center(
                      child: Text(
                        'Nothing To Show',
                        style: style.copyWith(
                          color: Colors.black,
                          fontSize: 24,
                        ),
                      ),
                    );
                  } else {
                    return buildListView(items: allBookings);
                  }
                }
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }

  ListView buildListView({required List<Bookings> items}) {
    print(items);
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? BounceInLeft(
                  child: _buildcartitem(myItems: items, index: index))
              : BounceInRight(
                  child: _buildcartitem(myItems: items, index: index));
        });
  }

  Widget _buildcartitem({required List<Bookings> myItems, required int index}) {

    print(myItems);
    return AspectRatio(
      aspectRatio: 3 / 2.3,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            // color: myItems[index].cost,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 10,
                  color: Color(0xFF9E9898),
                  offset: Offset(0, 10))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  Text(

                    'Booking Id: ' + myItems[index].bookingId.toString(),
                    maxLines: 1,
                    style: style.copyWith(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'Booked On: ' + dateFormat.format(myItems[index].bookingTime),
                    maxLines: 1,
                    style: style.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Text(
                    'Booked Time:' + myItems[index].bookedTime,
                    style: style.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  FutureBuilder(
                      future: APIServices.getUser(myItems[index].currentUserEmail),
                      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          // print(snapshot.data);
                          User myUser = snapshot.data;
                          print(myUser);
                          if (snapshot.hasData){
                            return  Text(
                              'Booked By: '+ myUser.name,
                              style: style.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            );
                          }
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

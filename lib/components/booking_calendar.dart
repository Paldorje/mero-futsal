import 'package:booking_calendar/booking_calendar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/cart_model.dart';
import '../models/futsal_arenas.dart';

class BookingCalendarPage extends StatefulWidget {
  // final FutsalArenas item;
  const BookingCalendarPage({Key? key,
    // required this.item
  }) : super(key: key);

  @override
  State<BookingCalendarPage> createState() => _BookingCalendarPageState();
}

class _BookingCalendarPageState extends State<BookingCalendarPage> {
  final now = DateTime.now();
  late BookingService mockBookingService;

  @override
  void initState() {
    super.initState();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 60,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart,
      end: newBooking.bookingEnd,
    ));
    const Center(child: CircularProgressIndicator());
    // bookedGround.add(
    //       CartModel(
    //         name: widget.item.futsalName,
    //         price: widget.item.cost,
    //         // img: widget.item.img,
    //         color: Colors.red,
    //         items: 1,
    //         size: 6,
    //       ),
    //     );
    //     total = total + widget.item.cost;
    //     Navigator.pop(context);
    if (kDebugMode) {
      print('${newBooking.toJson()} has been uploaded');
    }
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    ///here you can parse the streamResult and convert to [List<DateTimeRange>]
    DateTime first = now;
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted
        .add(DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(
        DateTimeRange(start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(
        DateTimeRange(start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(
        DateTimeRange(start: fourth, end: fourth.add(const Duration(minutes: 50))));
    return converted;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF282638),
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
        title: const Text('Choose Booking Date and Time'),
      ),
      body: Center(
        child: BookingCalendar(
          bookingService: mockBookingService,
          convertStreamResultToDateTimeRanges: convertStreamResultMock,
          getBookingStream: getBookingStreamMock,
          uploadBooking: uploadBookingMock,
          bookingButtonText: 'Book',
          bookingButtonColor: Colors.pink,
          bookingExplanation: const Center(child: CircularProgressIndicator()),
          // loadingWidget: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

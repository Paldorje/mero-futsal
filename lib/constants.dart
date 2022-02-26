import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mero_futsal/models/cart_model.dart';
import 'package:mero_futsal/models/futsal_arenas.dart';

const kBottomContainerHeight = 200.0;
const kActiveCardColor = Color(0xFFFFFFFF);
const kInactiveCardColor = Color(0xFFFFFFFF);
const kBottomContainerColor = Color(0xFFE81E63);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);


const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
);

const firstIntrTitleText = 'Welcome';
const secondIntrTitleText = 'Manage Arenas';
const thirdIntrTitleTextt = 'Book Grounds';

const firstIntrContentText =
    'Welcome to Mero Futsal';

const secondIntrContentText =
    'You can manage your futsal grounds here ! ';

const thirdIntrContentText =
    'Book you favourite futsal grounds and start playing! ';




final TextStyle style = GoogleFonts.lato(
    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700);
const Color bleu = Color(0xFF148BFF);
const Color red = Color(0xFFC3011B);
const Color white = Color(0xFFDCDBEB);


List<FutsalArenas> allArenas = [
  FutsalArenas(
      name: 'Sherpa Futsal',
      img: 'assets/images/one.png',
      company: 'Baudha',
      price: 1000,
      isselected: false,
      color: red),
  FutsalArenas(
      name: 'Sherpa Futsal',
      img: 'assets/images/one.png',
      company: 'Baudha',
      price: 1000,
      isselected: false,
      color: Colors.amber.shade700),
  FutsalArenas(
      name: 'Sherpa Futsal',
      img: 'assets/images/one.png',
      company: 'Baudha',
      price: 1000,
      isselected: false,
      color: bleu),
  FutsalArenas(
      name: 'Sherpa Futsal',
      img: 'assets/images/one.png',
      company: 'Baudha',
      price: 1000,
      isselected: false,
      color: Colors.teal),
  FutsalArenas(
      name: 'Sherpa Futsal',
      img: 'assets/images/one.png',
      company: 'Baudha',
      price: 1000,
      isselected: false,
      color: Colors.amber.shade700),
  FutsalArenas(
      name: 'Sherpa Futsal',
      img: 'assets/images/one.png',
      company: 'Baudha',
      price: 1000,
      isselected: false,
      color: bleu),

  FutsalArenas(
      name: 'Sherpa Futsal',
      img: 'assets/images/one.png',
      company: 'Baudha',
      price: 1000,
      isselected: false,
      color: Colors.amber.shade700),
];

List times = [6, 7, 8, 9, 10];

List<CartModel> bookedGround = [];
List<FutsalArenas> favouriteArenas = [];

double total = 0.00;
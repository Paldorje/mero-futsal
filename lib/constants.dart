import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mero_futsal/models/cart_model.dart';
import 'package:mero_futsal/models/futsal_arenas.dart';

const kBottomContainerHeight = 200.0;
const kPlayerButtonColor = Color(0xFFE81E63);
const kOwnerButtonColor = Color(0xFF4440FA);

const kPlayerLoginText = 'Login as Player';
const kOwnerLoginText = 'Login as Owner';

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  letterSpacing: 2,
  fontWeight: FontWeight.bold,
);

const kFirstIntrTitleText = 'Welcome';
const kSecondIntrTitleText = 'Manage Arenas';
const kThirdIntrTitleTextt = 'Book Grounds';

const kFirstIntrContentText =
    'Welcome to Mero Futsal';

const kSecondIntrContentText =
    'You can manage your futsal grounds here ! ';

const kThirdIntrContentText =
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
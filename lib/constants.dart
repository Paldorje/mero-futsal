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

const kFirstIntroTitleText = 'Welcome';
const kSecondIntroTitleText = 'Manage Arenas';
const kThirdIntroTitleText = 'Book Grounds';

const kFirstIntroContentText = 'Welcome to Mero Futsal';

const kSecondIntroContentText = 'You can manage your futsal grounds here ! ';

const kThirdIntroContentText =
    'Book you favourite futsal grounds and start playing! ';

final TextStyle style = GoogleFonts.lato(
    fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700);
const Color bleu = Color(0xFF148BFF);
const Color red = Color(0xFFC3011B);
const Color white = Color(0xFFDCDBEB);

List times = [6, 7, 8, 9, 10];

List<CartModel> bookedGround = [];
List<FutsalArenas> favouriteArenas = [];


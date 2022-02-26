import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:mero_futsal/constants.dart';

final pages = [
  PageViewModel(
      pageColor: const Color(0xFF282638),
      //  bubble: CachedNetworkImage(imageUrl: firstImageIcon),
      body: const Text(kFirstIntrContentText),
      title: const Text(
        kFirstIntrTitleText,
      ),
      textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        'assets/images/one.png',
        height: 420.0,
        width: 420.0,
        alignment: Alignment.center,
      )),
  PageViewModel(
    pageColor: const Color(0xFF282638),
    // bubble: CachedNetworkImage(imageUrl: secondImageIcon),

    body: const Text(kSecondIntrContentText),
    title: const Text(kSecondIntrTitleText),
    mainImage: Image.asset(
      'assets/images/two.png',
      height: 420.0,
      width: 420.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
  PageViewModel(
    pageColor: const Color(0xFF282638),
    //bubble: CachedNetworkImage(imageUrl: thirdImageIcon),
    body: const Text(kThirdIntrContentText),
    title: const Text(kThirdIntrTitleTextt),
    mainImage: Image.asset(
      'assets/images/three.png',
      height: 420.0,
      width: 420.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
];
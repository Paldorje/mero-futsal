import 'package:flutter/material.dart';

import '../constants.dart';

class Button extends StatelessWidget {
   const Button({Key? key, required this.onTap, required this.buttonTitle}) : super(key: key);

  final onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttonTitle, style: kLargeButtonTextStyle),
        ),
        color: kPlayerButtonColor,
        margin: const EdgeInsets.all(9.0),
        padding: const EdgeInsets.all(20.0),
        height: kBottomContainerHeight,
      ),
    );
  }
}

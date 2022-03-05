import 'package:flutter/material.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/pages/ownerLogin_page.dart';
import 'playerLogin_page.dart';


class UsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _screenheight = MediaQuery.of(context).size.height;
    var _screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(40, 38, 56, 1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Text(
              'Mero Futsal',
              style: style.copyWith(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildGestureDetector(context, _screenwidth, _screenheight, kPlayerLoginText, kPlayerButtonColor, PlayerLoginPage()),
            SizedBox(height: 15.0,),
            buildGestureDetector(context, _screenwidth, _screenheight, kOwnerLoginText, kOwnerButtonColor, OwnerLoginPage()),
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(BuildContext context, double _screenwidth, double _screenheight, var text, Color color, var method) {
    return GestureDetector(
            onTap: (){Navigator.push(context,
              MaterialPageRoute(builder: (context) => method),);},
            child: Container(
              width: _screenwidth,
              height: _screenheight * .2,
              child: Center(child: Text(text, style: kLargeButtonTextStyle,)),
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(30),
                  )),),);
  }
}
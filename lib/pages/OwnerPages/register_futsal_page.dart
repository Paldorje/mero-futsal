import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mero_futsal/models/futsal_arenas.dart';
import 'package:mero_futsal/pages/OwnerPages/owner_home_page.dart';

import '../../models/api.services.dart';

class RegisterFutsal extends StatefulWidget {
  final String email;
  const RegisterFutsal({Key? key, required this.email}) : super(key: key);

  @override
  State<RegisterFutsal> createState() => _RegisterFutsalState();
}

class _RegisterFutsalState extends State<RegisterFutsal> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();
  final TextEditingController _controllerPrice = TextEditingController();

  bool _isVisible = false;
  String returnVisibilityString = "";

  bool returnVisibility(String name, String email, String location) {
    if (name == "") {
      returnVisibilityString = "Name cannot be Empty";
    } else if (email == "") {
      returnVisibilityString = "Email cannot be empty";
    } else if (location == "") {
      returnVisibilityString = "Password fields cant be empty";
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      //   title: const Center(
      //     child: Text(
      //       "Register Futsal",
      //     ),
      //   ),
      // ),
      body: ListView(children: [
        Visibility(
          visible: _isVisible,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 20, left: 17),
            child: Text(
              returnVisibilityString,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 10,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 8, right: 8, left: 8),
          child: TextField(
            focusNode: FocusNode(),
            controller: _controllerName,
            onTap: () {
              setState(() {
                _isVisible = false;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Futsal Name:",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controllerLocation,
            onTap: () {
              setState(() {
                _isVisible = false;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Location:",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controllerPrice,
            onTap: () {
              setState(() {
                _isVisible = false;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Price:",
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: ElevatedButton(
              child:
                  const Text("Submit", style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              onPressed: () async {
                if (_controllerName.text != "" &&
                    _controllerLocation.text != "" &&
                    _controllerPrice.text != "") {

                  FutsalArenas futsal = FutsalArenas(
                    futsalId: 0,
                    futsalName: _controllerName.text,
                    location: _controllerLocation.text,
                    cost: int.parse(_controllerPrice.text),
                    ownerEmail: widget.email,
                    isDeleted: false,
                    isReserved: false,
                  );

                  await APIServices.postFutsal(futsal);
                  if (kDebugMode) {
                    print("I got in here");
                  }

                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => OwnerHomePage(email: widget.email)),
                        (Route<dynamic> route) => false,
                  );

                } else {
                  _isVisible = true;
                  returnVisibilityString = "All fields must not be empty";
                }
              }),
        ),
        FutureBuilder(
            // future: APIServices.getOwner(widget.email),
            future: APIServices.getOwner(widget.email),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                var user = snapshot.data;
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Center(
                          child: Text(
                        "Your Details",
                        style: TextStyle(fontSize: 16),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: TextEditingController(text: user.name),
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Owner's Name: ",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: TextEditingController(text: user.email),
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Owner's Email: ",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: TextEditingController(text: user.phone),
                        readOnly: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Owner's Phone: ",
                        ),
                      ),
                    ),
                  ],
                );
              }
              ;
              return const Center(child: CircularProgressIndicator());
            }),
      ]),
    );
  }
}

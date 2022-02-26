import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mero_futsal/pages/login_page.dart';
// import 'package:flutter_user_profile/pages/edit_description.dart';
// import 'package:flutter_user_profile/pages/edit_email.dart';
// import 'package:flutter_user_profile/pages/edit_image.dart';
// import 'package:flutter_user_profile/pages/edit_name.dart';
// import 'package:flutter_user_profile/pages/edit_phone.dart';
// import '../user/user.dart';
// import '../widgets/display_image_widget.dart';
// import '../user/user_data.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // final user = UserData.myUser;

    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(64, 105, 225, 1),
                    ),
                  ))),
      buildProfile(),
          buildUserInfoDisplay('Name'),
          buildUserInfoDisplay( 'Phone'),
          buildUserInfoDisplay( 'Email'),
          Center(
            child: ElevatedButton(
                child: Text("Logout", style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false,
                  );
                }),
          ),
          // InkWell(
          //     onTap: () {
          //       // navigateSecondPage(EditImagePage());
          //     },
          //     // child: DisplayImage(
          //     //   imagePath: user.image,
          //     //   onPressed: () {},
          //     // ),
          // ),
          // Expanded(
          //   child: buildAbout(user),
          //   flex: 4,
          // )
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String title) =>
      Padding(
          padding: EdgeInsets.only(bottom: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ))),
                  // child: Row(children: [
                  //   Expanded(
                  //       child: TextButton(
                  //           onPressed: () {
                  //             navigateSecondPage(editPage);
                  //           },
                  //           child: Text(
                  //             getValue,
                  //             style: TextStyle(fontSize: 16, height: 1.4),
                  //           ))),
                  //   Icon(
                  //     Icons.keyboard_arrow_right,
                  //     color: Colors.grey,
                  //     size: 40.0,
                  //   )
                  // ])
                )
            ],
          ));

  // Widget builds the About Me Section
  // Widget buildAbout() =>

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}

class buildProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Informations',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ))),
                child: Row(children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () {
                            // navigateSecondPage(EditDescriptionFormPage());
                          },
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                              child: Align(
                                alignment: Alignment.topLeft,
                                // child: Text(
                                //   user.aboutMeDescription,
                                //   style: TextStyle(
                                //     fontSize: 16,
                                //     height: 1.4,
                                //   ),
                                // )
                              )))),

                ],
                ),
            ),
          ],
        ));
  }
}

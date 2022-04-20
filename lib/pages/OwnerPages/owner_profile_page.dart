import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mero_futsal/models/api.services.dart';
import 'package:mero_futsal/pages/PlayerPages/player_login_page.dart';
import 'package:mero_futsal/pages/ProfileEditPages/edit_address.dart';
import 'package:mero_futsal/pages/ProfileEditPages/edit_email.dart';
import 'package:mero_futsal/pages/ProfileEditPages/edit_image.dart';
import 'package:mero_futsal/pages/ProfileEditPages/edit_name.dart';
import 'package:mero_futsal/pages/ProfileEditPages/edit_phone.dart';
import 'package:mero_futsal/widgets/display_image_widget.dart';

import 'owner_login_page.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class OwnerProfilePage extends StatefulWidget {
  final String email;
  const OwnerProfilePage({Key? key, required this.email}) : super(key: key);

  @override
  _OwnerProfilePageState createState() => _OwnerProfilePageState();
}

class _OwnerProfilePageState extends State<OwnerProfilePage> {
  @override
  Widget build(BuildContext context) {
    // final user = APIServices.myUser;

    return Scaffold(
      // backgroundColor: Colors.grey,
      body: FutureBuilder(
        // future: APIServices.getOwner(widget.email),
          future: APIServices.getOwner(widget.email),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (kDebugMode) {
            print(snapshot.data);
          }
          if(snapshot.hasData) {
            var user = snapshot.data;
            return Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  toolbarHeight: 10,
                ),
                InkWell(
                  onTap: () {
                    navigateSecondPage(const EditImagePage());
                  },
                  child: DisplayImage(
                    imagePath: user.photo,
                    onPressed: () {},
                  ),
                ),
                buildUserInfoDisplay(user.name, 'Name', const EditNameFormPage()),
                buildUserInfoDisplay(user.email, 'Email', const EditEmailFormPage()),
                buildUserInfoDisplay(user.phone, 'Phone', const EditPhoneFormPage()),
                buildUserInfoDisplay(user.address, 'Address', const EditAddressFormPage()),
                Center(
                  child: ElevatedButton(
                      child: const Text(
                          "Logout", style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              const OwnerLoginPage()),
                              (Route<dynamic> route) => false,
                        );
                      }),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());}),
      );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Expanded(
        child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
                    width: 350,
                    height: 40,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ))),
                    child: Row(children: [
                      Expanded(
                          child: TextButton(
                              onPressed: () {
                                navigateSecondPage(editPage);
                              },
                              child: Text(
                                getValue,
                                style: const TextStyle(fontSize: 16, height: 1.4),
                              ))),
                      const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 40.0,
                      )
                    ]))
              ],
            )),
      );

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


import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/api.services.dart';
import '../../models/owner.dart';
import 'owner_login_page.dart';

class OwnerSignupPage extends StatefulWidget {
  const OwnerSignupPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupPage();
}

class _SignupPage extends State<OwnerSignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
      body: const SignupPageContent(),
      bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Mero Futsal",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}

class SignupPageContent extends StatefulWidget {
  const SignupPageContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignupPageContent();
}

class _SignupPageContent extends State<SignupPageContent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  bool _isVisible = false;
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  String returnVisibilityString = "";

  bool returnVisibility(String password1, String password2, String email, String name) {
    if (password1 != password2) {
      returnVisibilityString = "Passwords do not match";
    } else if(name == ""){
      returnVisibilityString = "Name cannot be Empty";
    } else if (email == "") {
      returnVisibilityString = "Email cannot be empty";
    } else if (password1 == "" || password2 == "") {
      returnVisibilityString = "Password fields cant be empty";
    } else if (!auth.isPasswordCompliant(password1)) {
      returnVisibilityString = "Not password compliant";
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Sized Box
          const SizedBox(
            height: 37.5,
            width: 400,
          ),

          // Signup Text
          Center(
            child: Container(
              height: 225,
              width: 400,
              alignment: Alignment.center,
              child: const Text(
                "Signup",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Wrong password text
          Visibility(
            visible: _isVisible,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: Text(
                returnVisibilityString,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                ),
              ),
            ),
          ),

          // Signup Info
          Container(
            height: 265,
            width: 530,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: <Widget>[
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },
                  controller: nameController, // Controller for Email
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
                      contentPadding: EdgeInsets.all(17)),
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
                const Divider(
                  thickness: 3,
                ),
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },
                  controller: emailController, // Controller for Email
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      contentPadding: EdgeInsets.all(17)),
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
                const Divider(
                  thickness: 3,
                ),
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },

                  controller: passwordController1, // Controller for Password
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      contentPadding: const EdgeInsets.all(17),
                      // Adding the visibility icon to toggle visibility of the password field
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure1
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure1 = !_isObscure1;
                          });
                        },
                      )),
                  obscureText: _isObscure1,
                ),
                const Divider(
                  thickness: 3,
                ),
                TextFormField(
                  onTap: () {
                    setState(() {
                      _isVisible = false;
                    });
                  },

                  controller: passwordController2, // Controller for Password
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Re-enter Password",
                      contentPadding: const EdgeInsets.all(17),
                      // Adding the visibility icon to toggle visibility of the password field
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure2
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isObscure2 = !_isObscure2;
                          });
                        },
                      )),
                  obscureText: _isObscure2,
                ),
              ],
            ),
          ),

          // Signup Submit button
          Container(
            width: 570,
            height: 70,
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
                child: const Text("Submit", style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () async {
                  if (kDebugMode) {
                    print(
                        "Email: ${emailController.text}\npassword: ${passwordController1.text}\nretry password ${passwordController2.text}");
                  }

                  if (emailController.text != "" &&
                      passwordController1.text == passwordController2.text &&
                      passwordController2.text != "" &&
                      auth.isPasswordCompliant(passwordController1.text)) {
                    if (kDebugMode) {
                      print("I got in here");
                    }
                    if (!auth.checkUserRepeat(emailController.text)) {
                      auth.insertCredentials(
                          emailController.text, passwordController1.text);

                      Owner owner = Owner(
                          name: nameController.text,
                          password: passwordController1.text,
                          address: 'Add Address',
                          phone: 'Add Phone',
                          email: emailController.text.toLowerCase(),
                          photo: 'https://upload.wikimedia.org/wikipedia/commons/2/24/Baby_Madison_-_Soccer_%28Cameroon%29.png',
                          isDeleted: false,
                          isAvailable: true);

                      await APIServices.postOwner(owner);
                      if (kDebugMode) {
                        print("I got in here");
                      }

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const OwnerLoginPage()),
                        (Route<dynamic> route) => false,
                      );
                    } else {
                      setState(() {
                        returnVisibilityString = "Email already exists";
                        _isVisible = true;
                      });
                    }
                  } else {
                    setState(() {
                      _isVisible = returnVisibility(passwordController1.text,
                          passwordController2.text, emailController.text, nameController.text);
                    });
                  }
                }),
          ),
        ],
      ),
    );
  }
}

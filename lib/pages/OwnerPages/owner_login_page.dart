import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mero_futsal/constants.dart';
import 'package:mero_futsal/pages/OwnerPages/owner_home_page.dart';
import 'package:mero_futsal/pages/OwnerPages/owner_signup_page.dart';

import '../../components/authentication.dart';

final auth = Authentication();

class OwnerLoginPage extends StatelessWidget {
  const OwnerLoginPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'SanFrancisco',
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(40, 38, 56, 1),
        body: const LoginScreen(),
        bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Mero Futsal ",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 60,
              width: 200,
            ),

            // Login text Widget
            Center(
              child: Container(
                height: 200,
                width: 400,
                alignment: Alignment.center,
                child: const Text(
                  kOwnerLoginText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),

            const SizedBox(
              height: 60,
              width: 10,
            ),

            // Wrong Password text
            Visibility(
              visible: _isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "Wrong credentials entered",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 10,
                  ),
                ),
              ),
            ),

            // Textfields for Email and password fields
            Container(
              height: 140,
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
                    controller: emailController, // Controller for Username
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        contentPadding: EdgeInsets.all(20)),
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

                    controller: passwordController, // Controller for Password
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        contentPadding: const EdgeInsets.all(20),
                        // Adding the visibility icon to toggle visibility of the password field
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        )),
                    obscureText: _isObscure,
                  ),
                ],
              ),
            ),

            // Submit Button
            Container(
              width: 570,
              height: 70,
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  child: const Text("Submit", style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(kOwnerButtonColor),
                  ),
                  onPressed: () {
                    login(emailController.text.toString().toLowerCase(),
                        passwordController.text.toString());
                  }),
            ),

            // Register
            Container(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Center(
                    child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                          text: " Register here",
                          style: const TextStyle(
                              color: Colors.pink, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OwnerSignupPage()),
                                  )
                                }),
                    ],
                  ),
                )))
          ],
        ));
  }

  void login(String email, String password) async {
    try {
      Response response = await post(
          (Uri.parse(
              'https://10.0.2.2:7267/Api/Owners/login $email, $password')),
          body: {'email': email, 'password': password});
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        // if (auth.fetchCredentials(
        //     email, password)) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => OwnerHomePage(email: email,)),
              (Route<dynamic> route) => false,
        );
      } else {
        setState(() {
          _isVisible = true;
        });
        if (kDebugMode) {
          print('Failed');
        }
        if (kDebugMode) {
          print('Logged In');
        }
      }

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}

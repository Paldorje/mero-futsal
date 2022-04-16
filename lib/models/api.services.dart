import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'futsal_arenas.dart';
import 'user.dart';

class APIServices {
  static Future fetchFutsals() async {
    final response = await get(Uri.parse('https://10.0.2.2:7267/api/Futsals'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      if (kDebugMode) {
        print(body);
      }
      List<FutsalArenas> allArenas =
          body.map((dynamic item) => FutsalArenas.fromJson(item)).toList();
      // print(allArenas);
      return allArenas;
    } else {
      throw Exception('Failed to load Futsal');
    }
  }

  static Future fetchUsers() async {
    final response = await get(Uri.parse('https://10.0.2.2:7267/api/Users'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Failed to load User');
    }
  }

  static Future getUser(String email) async {
    final response = await get(Uri.parse('https://10.0.2.2:7267/api/Users/$email'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users =
      body.map((dynamic item) => User.fromJson(item)).toList();
      return users;
    } else {
      throw Exception('Failed to load User');
    }
  }


  static User myUser = User(
      name: 'Test Test',
      email: 'test.test@gmail.com',
      address: 'Your Address',
      phone: 'Your phone number',
      password: 'Password',
      photo:
          "https://upload.wikimedia.org/wikipedia/commons/2/24/Baby_Madison_-_Soccer_%28Cameroon%29.png");

  static Future postUser(User user) async {
    const String url = 'https://10.0.2.2:7267/Api/Users/';

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    Map<dynamic, dynamic> testBody = {
      "name": "test3",
      "email": "we@gmail.com",
      "password": "Test@123",
      "address": "we",
      "phone": "1283918902",
      "isAvailable":true,
      "isDeleted":false
    };
    var testBody1 = json.encode(testBody);
    var myUser = user.toJson();
    // var userBody = json.encode(myUser);
    var res = await post(Uri.parse(url), headers: header, body: testBody1);
    if (kDebugMode) {
      print(res.statusCode);
    }
    if (kDebugMode) {
      print(res.reasonPhrase);
    }
    if (kDebugMode) {
      print(res.body);
    }
    if (kDebugMode) {
      print(res.toString());
    }

    if (kDebugMode) {
      print(testBody);
    }
    return res.statusCode;
  }
}

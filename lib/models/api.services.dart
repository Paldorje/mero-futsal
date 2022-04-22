import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:mero_futsal/models/bookings.dart';
import 'package:mero_futsal/models/owner.dart';

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

  static Future fetchBookingsByFutsal(int futsalId) async {
    final response = await get(Uri.parse('https://10.0.2.2:7267/api/Bookings/byFutsal $futsalId'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      if (kDebugMode) {
        print(body);
      }
      List<Bookings> allBookings =
      body.map((dynamic item) => Bookings.fromJson(item)).toList();
      print(allBookings);
      return allBookings;
    } else {
      throw Exception('Failed to load Futsal');
    }
  }

  static Future fetchOwnerFutsal(String ownerEmail) async {
    final response = await get(Uri.parse('https://10.0.2.2:7267/api/Futsals/myFutsal $ownerEmail'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      if (kDebugMode) {
        print(body);
      }
      List<FutsalArenas> ownerArena =
          body.map((dynamic item) => FutsalArenas.fromJson(item)).toList();
      // print(allArenas);
      return ownerArena;
    } else {
      throw Exception('Failed to load Futsal');
    }
  }

  static Future fetchUsers() async {
    final response = await get(Uri.parse('https://10.0.2.2:7267/api/Users'));
    print (response.statusCode);
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<User> users =
          body.map((dynamic item) => User.fromJson(item)).toList();
      print(users);
      return users;
    } else {
      throw Exception('Failed to load User');
    }
  }

  static Future getOwner(String email) async {
    final response = await get(Uri.parse('https://10.0.2.2:7267/api/Owners/byEmail$email'));
    if (response.statusCode == 200) {
      print(response.body);

      Map<String, dynamic> owner =  Map<String, dynamic>
          .from(json.decode(response.body));

      print(owner);

      Owner owners = Owner.fromJson(owner);
      return owners;
    } else {
      throw Exception('Failed to load User');
    }
  }


  static Future getUser(String email) async {
    final response = await get(Uri.parse('https://10.0.2.2:7267/Api/Users/$email'));
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      print(response.body);

      Map<String, dynamic> user =  Map<String, dynamic>
      .from(json.decode(response.body));

      print(user);

      User users = User.fromJson(user);

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
    const String url = 'https://10.0.2.2:7267/Api/Users/register';

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var myUser = user.toJson();
    var userBody = json.encode(myUser);
    var res = await post(Uri.parse(url), headers: header, body: userBody);
    if (kDebugMode) {
      print(res.statusCode);
    }
    return res.statusCode;
  }

  static Future postOwner(Owner owner) async {
    const String url = 'https://10.0.2.2:7267/Api/Owners/';

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var myOwner = owner.toJson();
    var ownerBody = json.encode(myOwner);
    var res = await post(Uri.parse(url), headers: header, body: ownerBody);
    return res.statusCode;
  }

  static Future postFutsal(FutsalArenas futsalArenas) async {
    const String url = 'https://10.0.2.2:7267/Api/Futsals/';

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var myFutsal = futsalArenas.toJson();
    var futsalBody = json.encode(myFutsal);
    var res = await post(Uri.parse(url), headers: header, body: futsalBody);
    if (kDebugMode) {
      print(res.statusCode);
    }
    return res.statusCode;
  }

}

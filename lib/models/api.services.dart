import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'user.dart';

class APIServices {

  static User myUser = User(
    name: 'Test Test',
    email: 'test.test@gmail.com',
    address:'Kathmandu',
    phone: '(208) 206-5039',
    password: 'Password',
  );

  static Future fetchUsers() async {
    final response = await get(Uri.parse('https://10.0.0.2:7267/Api/User'));

    if(response.statusCode == 200){
      return User.fromJson(jsonDecode(response.body));
    } else{
      throw Exception('Failed to load User');
    }
  }

  static Future postUser(User user) async {

    const String url = 'https://10.0.2.2:7267/Api/User/register';

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
     Map<String, String> testBody = {
       "name":"test3",
       "email":"we@gmail.com",
       "password":"Test@123",
       "address":"we",
       "phone":"1283918902"
       // "isAvailable":true,
       // "isDeleted":false
    };
     var testBody1 = json.encode(testBody);
    var myUser = user.toJson();
    var userBody = json.encode(myUser);
    var res = await post(Uri.parse(url), headers: header, body: testBody1);
    print(res.statusCode);
    print(res.reasonPhrase);
    print(res.body);
    print(res.toString());



    print(testBody);
    return res.statusCode;
  }
}
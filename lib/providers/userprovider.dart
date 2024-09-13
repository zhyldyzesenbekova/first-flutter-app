import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zhyldyz_flutter/models/user.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [];

  Future getUsers() async {
    var response = await http.get(Uri.https('fake-json-api.mock.beeceptor.com', '/users'));
    var jsonData = jsonDecode(response.body);

    for (var eachUser in jsonData){
      final user = User(name: eachUser['name'],
      email: eachUser['email'],
      photo: eachUser['phone']
      );
      users.add(user);
    }
    print(users.length);
    
  }
}

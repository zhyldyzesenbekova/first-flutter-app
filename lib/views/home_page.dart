import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:zhyldyz_flutter/models/user.dart';
import './second_page.dart';
import '../widgets/bottomnavigationbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'User List',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: FutureBuilder(future: getUsers(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].email),
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              child: CachedNetworkImage(
                imageUrl: users[index].photo,
                placeholder:(context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error), 
                imageBuilder: (context, imageProvider) => CircleAvatar(backgroundImage: imageProvider, 
                radius: 30, 
                ),
                ),
            ),
          );
          },
          );
        }
        else {
          return const Center(child: CircularProgressIndicator(),
          );
        }
      },
      ),
    );
  }
}




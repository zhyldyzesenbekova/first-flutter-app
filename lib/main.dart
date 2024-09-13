import 'package:flutter/material.dart';
import 'widgets/bottomnavigationbar.dart';
import 'views/home_page.dart'; 
import 'package:provider/provider.dart';
import 'providers/userprovider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider()..getUsers(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: myBottomNavBar(), 

    
    
      
    ),
      );
    
  }
}



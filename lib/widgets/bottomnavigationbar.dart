import 'package:flutter/material.dart';
import 'package:zhyldyz_flutter/views/home_page.dart';
import 'package:zhyldyz_flutter/views/second_page.dart';

class myBottomNavBar extends StatefulWidget {
  const myBottomNavBar({super.key});

  @override
  State<myBottomNavBar> createState() => _myBottomNavBarState();
}

class _myBottomNavBarState extends State<myBottomNavBar> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    SecondPage(),
  ];

  
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, 
        onTap: _onItemTapped, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Second Page',
          ),

        ],
      ),
    );
  }
}
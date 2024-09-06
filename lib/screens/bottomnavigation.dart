import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/screens/homePage.dart';
import 'package:instagram/screens/searchPage.dart';
import 'package:instagram/screens/postPage.dart';
import 'package:instagram/screens/reelPage.dart';
import 'package:instagram/screens/userPage.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int _currentIndex = 0;


  final List<Widget> _pages = [
    Homepage(),
    Searchpage(),
    Postpage(),
    Reelpage(),
    Userpage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home, size: 30,
              color: _currentIndex == 0 ? Colors.white : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search, size: 30,
              color: _currentIndex == 1 ? Colors.white : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined, size: 30,
              color: _currentIndex == 2 ? Colors.white : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.film, size: 30,
              color: _currentIndex == 3 ? Colors.white : Colors.grey,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person, size: 30,
              color: _currentIndex == 4 ? Colors.white : Colors.grey,
            ),
            label: '',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

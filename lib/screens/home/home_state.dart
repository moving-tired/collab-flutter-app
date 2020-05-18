import 'package:collab_flutter_app/screens/home/home.dart';
import 'package:collab_flutter_app/screens/map/map_sample.dart';
import 'package:collab_flutter_app/screens/profile/profile.dart';
import 'package:flutter/material.dart';

class HomeState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    MapSample(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(
      currentIndex: _currentIndex, // this will be set when a new tab is tapped
      onTap: (index) => {
        setState(() {
          _currentIndex = index;
        })
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        )
      ],
    );

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

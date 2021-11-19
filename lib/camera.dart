import 'package:flutter/material.dart';
import 'package:midterm_project/favorites.dart';
import 'package:midterm_project/homemenu.dart';

import 'search.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  int noFoodIndex = 0;
  int _selectedIndex = 2;
  List<String> options = ["Home", "Search", "Camera", "Favorite", "Person"];
  final isSelected = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(children: [
            SizedBox(height: 20),
            Container(
              child: Text("Camera"),
            ),
            SizedBox(height: 25),
            SizedBox(height: 150),
            Image.asset('assets/picture.png')
          ]),
        ),
        bottomNavigationBar: new BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 32,
            type: BottomNavigationBarType.fixed,
            items: [
              new BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home"),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              new BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: "Camera",
              ),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorite"),
              new BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Person")
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red,
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
                if (_selectedIndex == 3) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Favorites()));
                }
                if (_selectedIndex == 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Search()));
                }
                if (_selectedIndex == 0) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeMenu()));
                }
              });
            }));
  }
}

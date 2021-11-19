import 'package:flutter/material.dart';
import 'package:midterm_project/favorites.dart';
import 'package:midterm_project/homemenu.dart';

import 'camera.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int noFoodIndex = 0;
  int _selectedIndex = 1;
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
              child: Text("Search"),
            ),
            SizedBox(height: 25),
            SizedBox(height: 300),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(255, 147, 134, 1)),
                  minimumSize: MaterialStateProperty.all(Size(300, 100)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ))),
              onPressed: () {},
              child: Text('Search',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24)),
            )
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
                if (_selectedIndex == 2) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Camera()));
                }
                if (_selectedIndex == 0) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeMenu()));
                }
              });
            }));
  }
}

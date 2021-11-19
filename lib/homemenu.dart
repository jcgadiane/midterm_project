import 'package:flutter/material.dart';
import 'package:midterm_project/favorites.dart';
import 'package:midterm_project/search.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int noFoodIndex = 0;
  int _selectedIndex = 0;
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
              child: Text("Home"),
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
              child: Text('Home',
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
                // if (_selectedIndex == 2) {
                //   Navigator.pushReplacement(context,
                //       MaterialPageRoute(builder: (context) => Camera()));
                // }
                if (_selectedIndex == 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Search()));
                }
              });
            }));
  }
}

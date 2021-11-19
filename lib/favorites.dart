import 'package:flutter/material.dart';
import 'package:midterm_project/camera.dart';
import 'package:midterm_project/homemenu.dart';
import 'package:midterm_project/search.dart';

class NoFoodsInfo {
  final String image;
  final String text;
  final String text2;

  const NoFoodsInfo({
    required this.image,
    required this.text,
    required this.text2,
  });
}

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<NoFoodsInfo> noFoodInfo = [
    NoFoodsInfo(
      image: "assets/nofood.png",
      text: "No Foods Found",
      text2:
          "You don't save any food. Go ahead,\n search and save your favorite food.",
    ),
    NoFoodsInfo(
      image: "assets/norecipe.png",
      text: "No Recipes Found",
      text2:
          "You don't save any recipes. Go ahead,\n search and save your favorite recipe.",
    ),
  ];
  int noFoodIndex = 0;
  int _selectedIndex = 3;
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
              child: Text("Favorites"),
            ),
            SizedBox(height: 25),
            ToggleButtons(
                color: Color.fromRGBO(148, 205, 140, 1),
                selectedColor: Colors.white,
                selectedBorderColor: Color.fromRGBO(148, 205, 140, 1),
                fillColor: Color.fromRGBO(148, 205, 140, 1),
                splashColor: Color(0xFF6200EE).withOpacity(0.12),
                hoverColor: Color(0xFF6200EE).withOpacity(0.04),
                borderRadius: BorderRadius.circular(12.0),
                constraints: BoxConstraints(minHeight: 36.0),
                isSelected: isSelected,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 15),
                    child: Text("Foods"),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 15),
                    child: Text('Recipes'),
                  ),
                ],
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < isSelected.length; index++) {
                      if (index == newIndex) {
                        isSelected[index] = true;
                        noFoodIndex = newIndex;
                      } else {
                        isSelected[index] = false;
                      }
                    }
                  });
                }),
            SizedBox(height: 300),
            Column(
              children: <Widget>[
                Image.asset(
                  noFoodInfo[noFoodIndex].image,
                ),
                SizedBox(height: 25.0),
                Center(
                  child: Text(noFoodInfo[noFoodIndex].text,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 15.0),
                Center(
                    child: Text(
                  noFoodInfo[noFoodIndex].text2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  ),
                ))
              ],
            ),
            SizedBox(height: 150),
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
                if (_selectedIndex == 1) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Search()));
                }
                if (_selectedIndex == 0) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeMenu()));
                }
                if (_selectedIndex == 2) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Camera()));
                }
              });
            }));
  }
}

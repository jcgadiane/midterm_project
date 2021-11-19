import 'package:flutter/material.dart';

class FoodsInfo {
  final String title;
  final String image;
  final String description;
  final String gallery1;
  final String gallery2;
  final String gallery3;
  final String gallery4;
  final String gallery5;

  const FoodsInfo(
      {required this.title,
      required this.image,
      required this.description,
      required this.gallery1,
      required this.gallery2,
      required this.gallery3,
      required this.gallery4,
      required this.gallery5});
}

class FavoritesFilled extends StatefulWidget {
  const FavoritesFilled({Key? key}) : super(key: key);

  @override
  _FavoritesFilledState createState() => _FavoritesFilledState();
}

class _FavoritesFilledState extends State<FavoritesFilled> {
  List<FoodsInfo> foodInfo = [
    FoodsInfo(
      title: 'Cookie',
      image: 'assets/cookie.png',
      description: '12.99',
      gallery1: '12.99',
      gallery2: '12.99',
      gallery3: '12.99',
      gallery4: '12.99',
      gallery5: '12.99',
    ),
    FoodsInfo(
      title: 'Burger',
      image: 'assets/burger.png',
      description: '12.99',
      gallery1: '12.99',
      gallery2: '12.99',
      gallery3: '12.99',
      gallery4: '12.99',
      gallery5: '12.99',
    ),
    FoodsInfo(
      title: 'Cakes',
      image: 'assets/cake.png',
      description: '12.99',
      gallery1: '12.99',
      gallery2: '12.99',
      gallery3: '12.99',
      gallery4: '12.99',
      gallery5: '12.99',
    ),
    FoodsInfo(
      title: 'Pizza',
      image: 'assets/pizza.png',
      description: '12.99',
      gallery1: '12.99',
      gallery2: '12.99',
      gallery3: '12.99',
      gallery4: '12.99',
      gallery5: '12.99',
    ),
    FoodsInfo(
      title: 'Hotdog',
      image: 'assets/hotdog.png',
      description: '',
      gallery1: '12.99',
      gallery2: '12.99',
      gallery3: '12.99',
      gallery4: '12.99',
      gallery5: '12.99',
    ),
    FoodsInfo(
      title: 'Fries',
      image: 'assets/fries.png',
      description: '',
      gallery1: '12.99',
      gallery2: '12.99',
      gallery3: '12.99',
      gallery4: '12.99',
      gallery5: '12.99',
    ),
    FoodsInfo(
      title: 'Donuts',
      image: 'assets/donut.png',
      description: '12.99',
      gallery1: '12.99',
      gallery2: '12.99',
      gallery3: '12.99',
      gallery4: '12.99',
      gallery5: '12.99',
    ),
  ];
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
                      } else {
                        isSelected[index] = false;
                      }
                    }
                  });
                }),
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
              });
            }));
  }
}

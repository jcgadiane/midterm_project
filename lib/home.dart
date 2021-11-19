import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:midterm_project/favoritesFilled.dart';

import 'favorites.dart';
import 'splash.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  List<Map<String, String>> contentData = [
    {
      "image": "assets/eating.png",
      "text": "Eat Healthy",
      "text2":
          "Maintaining good health should \nbe the primary focus of everyone."
    },
    {
      "image": "assets/cooking.png",
      "text": "Healthy Recipes",
      "text2": "Browse thousands of healthy \nrecipes from all over the world."
    },
    {
      "image": "assets/tracking.png",
      "text": "Track Your Health",
      "text2": "With amazing inbuilt tools you \ncan track your progress."
    }
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 75),
            Container(
              child: Text(
                'kcal',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Color.fromRGBO(148, 205, 140, 1),
                ),
              ),
            ),
            SizedBox(height: 50),
            Expanded(
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: contentData.length,
                    itemBuilder: (context, index) => Content(
                        image: contentData[index]["image"],
                        text: contentData[index]["text"],
                        text2: contentData[index]["text2"]))),
            Container(
                child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(255, 147, 134, 1)),
                  minimumSize: MaterialStateProperty.all(Size(300, 100)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ))),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Favorites()));
              },
              child: Text('Get Started',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 24)),
            )),
            SizedBox(height: 20),
            Container(
              child: Text("Already Have An Account? Log in"),
            ),
            SizedBox(height: 150),
          ],
        ),
      )),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Color.fromRGBO(255, 147, 134, 0.1)
            : Color.fromRGBO(255, 147, 134, 0.1),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
    this.image,
    this.text,
    this.text2,
  }) : super(key: key);
  final String? image, text, text2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Image.asset(
            image!,
            height: 360,
            width: 360,
          ),
          SizedBox(height: 15.0),
          Center(
            child: Text(text!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(height: 15.0),
          Center(
              child: Text(
            text2!,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18, height: 1.2, fontWeight: FontWeight.w200),
          ))
        ],
      ),
    );
  }
}

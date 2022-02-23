import 'dart:ui';

import 'package:flutter/material.dart';

import 'on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnBoarding(),
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.red.shade700,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Zomato",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Climate conscious Delivery",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                Text(
                  "IN INDIA",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Image.asset(
              "assets/images/tree.png",
              height: h * .2,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/tree.png",
              height: h * .29,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20,
            child: Image.asset(
              "assets/images/tree.png",
              height: h * .2,
            ),
          ),
          Positioned(
            bottom: -30,
            left: 150,
            child: Image.asset(
              "assets/images/grass.png",
              height: h * .08,
            ),
          ),
          Positioned(
            bottom: h * .2,
            left: 0,
            child: Image.asset(
              "assets/images/cloud.png",
              color: Colors.white.withOpacity(0.5),
              height: h * .08,
            ),
          ),
          Positioned(
            bottom: h * .3,
            left: 120,
            child: Image.asset(
              "assets/images/cloud.png",
              color: Colors.white.withOpacity(0.5),
              height: h * .1,
            ),
          ),
          Positioned(
            bottom: h * .27,
            right: 10,
            child: Image.asset(
              "assets/images/cloud.png",
              color: Colors.white.withOpacity(0.5),
              height: h * .1,
            ),
          ),
        ],
      ),
    );
  }
}

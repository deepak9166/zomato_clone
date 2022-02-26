import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zomato_clone/util/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPedding),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              titleLine("Top brands for you"),
              roundImageList(),
              titleLine("Eat what make you happy"),
              roundImageList2(),
              titleLine("180 restaurants around you"),
            ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return foodCard();
              },
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }

  titleLine(String s) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appPedding / 2),
      child: Text(
        s,
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget roundImageText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appPedding / 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 120,
            width: 100,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/demo/logomc.png"),
                  radius: 60,
                ),
                Positioned(
                    bottom: 0, left: 0, right: 0, child: offerBox("40% OFF"))
              ],
            ),
          ),
          Text(
            "McDonald's",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/timer.png",
                height: 12,
                width: 12,
              ),
              Text(" 47 min", style: TextStyle(color: Colors.grey))
            ],
          )
        ],
      ),
    );
  }

  Widget roundImageTex2() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: appPedding / 2, horizontal: appPedding / 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 80,
            width: 65,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/demo/pizza.jpg"),
              radius: 65,
            ),
          ),
          Text(
            "Pizza",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget offerBox(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPedding / 2),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  roundImageList() {
    return SizedBox(
      height: 170,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: appPedding / 2),
                child: roundImageText(),
              )),
    );
  }

  roundImageList2() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          for (var item in [0, 1, 2, 4, 5, 6, 7, 8]) roundImageTex2(),
          TextButton(
            onPressed: () {},
            child: const Center(
                child: Text(
              "See more >",
              style: TextStyle(color: Colors.black),
            )),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      side: const BorderSide(color: Colors.grey))),
            ),
          )
        ],
      ),
    );
  }
}

Widget foodCard() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: appPedding / 2),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          decoration:
              BoxDecoration(color: Colors.white, boxShadow: [BoxShadow()]),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    // height: 130,
                    // width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "assets/demo/pizza.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "DK Fast Food",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.green),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "3.3",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Image.asset(
                                    "assets/images/star.png",
                                    color: Colors.white,
                                    height: 12,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("North Indian, chinese, south Indian"),
                          Text("\$100 for one")
                        ],
                      )),
                ],
              ),
              Container(
                height: 20,
                color: Colors.green.withOpacity(0.9),
                child: Center(
                  child: Text(
                    "PURE VEG RESTAURANT",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                  right: appPedding,
                  top: appPedding,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        "assets/images/heart.png",
                        height: 20,
                      ),
                    ),
                  ))
            ],
          )),
    ),
  );
}

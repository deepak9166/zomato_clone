import 'package:flutter/material.dart';
import 'package:zomato_clone/util/constant.dart';

import 'home_screen.dart';

class DiningScreen extends StatefulWidget {
  const DiningScreen({Key? key}) : super(key: key);

  @override
  _DiningScreenState createState() => _DiningScreenState();
}

class _DiningScreenState extends State<DiningScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPedding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Image.asset("assets/demo/offer.jpg"),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: categoriesIcon()),
        SliverList(
          delegate: SliverChildListDelegate([
            titleLine("Curated collections"),
          ]),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 180,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => locationCard(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: appPedding),
                child: foodCard(),
              );
            },
            childCount: 10,
          ),
        )
      ],
    );
  }

  Widget locationCard() {
    return Padding(
      padding: const EdgeInsets.only(left: appPedding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
            width: 150,
            height: 180,
            child: Stack(
              children: [
                Image.asset(
                  "assets/demo/fort.jpg",
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  // color: Colors.black,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 200,
                        offset: Offset(0, 150),
                        spreadRadius: 10)
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(appPedding),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Best of Jodhpur",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "9 places",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  categoriesIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: appPedding / 2),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            for (var item in [0, 1, 2, 4, 5, 6, 7, 8]) roundImageTex2(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPedding / 2),
              child: TextButton(
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
              ),
            )
          ],
        ),
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
              height: 65,
              width: 65,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 2, color: Colors.grey.shade400)
                  ],
                  // border: Border.all(
                  //   color: Colors.grey,
                  //   width: 1,
                  // ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/images/cutlery.png"),
                ),
              )),
          SizedBox(
            height: 8,
          ),
          Text(
            "Pizza",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  titleLine(String s) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: appPedding / 2, horizontal: appPedding),
      child: Text(
        s,
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zomato_clone/util/constant.dart';

import 'dashboard.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/bg.webp",
                        ))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    ListTile(
                      leading: topButtons("🌎English"),
                      trailing: topButtons("Skip"),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(appPedding),
                child: Column(
                  children: [
                    Text(
                      "India's #1 Food Delivery\nand Dining App",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    diverLineText("Log in or sign up"),
                    mobileTextField(),
                    continuneButton(),
                    diverLineText("or"),
                    socialButton(),
                    SizedBox(
                      height: appPedding,
                    ),
                    bottomLines(),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget diverLineText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appPedding / 2),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Divider(),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget topButtons(String text) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(color: Colors.white.withOpacity(0.7)),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.transparent))),
          backgroundColor:
              MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.5))),
      onPressed: () {},
    );
  }

  Widget mobileTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appPedding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  contentPadding: const EdgeInsets.all(20),
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  // prefixText: "+91",
                  // prefix: Text("+91"),
                  enabled: false,
                  prefixIcon: SizedBox(
                      width: 20,
                      child: Center(
                        child: Image.asset(
                          "assets/images/india.png",
                          height: 20,
                        ),
                      )),

                  prefixStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
                  ),
                ),
              )),
          const SizedBox(
            width: appPedding / 2,
          ),
          Expanded(
              flex: 8,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Phone Number",
                  contentPadding: const EdgeInsets.all(20),
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  filled: true,
                  // prefixText: "+91",
                  // prefix: Text("+91"),
                  prefixIcon: const SizedBox(
                      width: 20, child: Center(child: Text("+91"))),
                  prefixStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget continuneButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appPedding / 2),
      child: TextButton(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Continue",
                style: TextStyle(color: Colors.white.withOpacity(0.7)),
              ),
            ),
          ),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.transparent))),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red.shade400)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(),
              ));
        },
      ),
    );
  }

  Widget socialButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appPedding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/google.png"),
            ),
          ),
          SizedBox(
            width: appPedding,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.more_horiz),
          ),
        ],
      ),
    );
  }

  Widget bottomLines() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: appPedding),
      child: Text(
        "By continuing, you agree to our\nTerms of service privacy policy Content Policy",
        style: TextStyle(color: Colors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}

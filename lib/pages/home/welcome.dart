//import 'package:calculator/local%20controll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../intro_video.dart';
//import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static String routeName = "/welcome";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffFD7FA2), Color(0xffFFC400)])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Teddy",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 26),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Pearl",
                        style: TextStyle(
                            color: Color(0xffED3209),
                            fontWeight: FontWeight.w900,
                            fontSize: 26),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.1,
                          height: MediaQuery.of(context).size.height / 2.3,
                          child: Image.asset("assets/images/bg2.png",
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: MediaQuery.of(context).size.height / 1.8,
                        child: Image.asset(
                          "assets/images/Bg.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Choose the',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Drink ",
                                    style: TextStyle(
                                        color: Color(0xffFFC100),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                                Text("you love",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25))
                              ],
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          'We provide a varity of fresh Bubble tea with various flavors. Get fresh Tea easily.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xffDD9718,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                )),
                            onPressed: () {
                              Get.to(IntroVideo(),
                                  duration: const Duration(seconds: 1),
                                  transition: Transition.fade);
                            },
                            child: const Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

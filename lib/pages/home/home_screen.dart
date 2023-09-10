import 'package:bubbletea/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';
import '../../util/enums.dart';
import '../../util/size_config.dart';
import '../animation_auth/login/login_screen.dart';
import 'components/body.dart';
import 'components/coustom_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  HomeScreen({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    print(sharedPreferences.getString('token'));
    print(sharedPreferences.getString('id'));
    SizeConfig().init(context);
    return FutureBuilder(
      future: authController.checkUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map data = snapshot.data as Map;
          if (data['success'] == false) {
            return SafeArea(
              child: Scaffold(
                  body: WillPopScope(
                onWillPop: () {
                  return Future.value(false);
                },
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          end: Alignment(-0.5, -0.5),
                          colors: [Color(0xffFD7FA2), Color(0xffFFC400)])),
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset('assets/logo.png'),
                      ),
                      InkWell(
                        onTap: () {
                          Get.off(const LoginScreen(),
                              duration: const Duration(seconds: 1),
                              transition: Transition.fade);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFC400),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Login Again',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                actions: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xffFFC400),
                    child: Image(
                      image: NetworkImage(
                          'https://static.vecteezy.com/system/resources/previews/014/194/232/original/avatar-icon-human-a-person-s-badge-social-media-profile-symbol-the-symbol-of-a-person-vector.jpg'),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
                title: const Text(
                  'Teddy Pearl',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                leading: const Icon(
                  Icons.line_weight_rounded,
                  color: Colors.black,
                ),
              ),
              body: const Body(),
              bottomNavigationBar:
                  const CustomBottomNavBar(selectedMenu: MenuState.home),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

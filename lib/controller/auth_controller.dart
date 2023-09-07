import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bubbletea/main.dart';
import 'package:bubbletea/pages/home/home_screen.dart';
import 'package:bubbletea/util/crud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/bottom_message.dart';
import '../util/links.dart';

class AuthController extends GetxController {
  Future login(
      {required String email,
      required String pass,
      required BuildContext context}) async {
    var data =
        await Crud.postRequest(loginLink, {'password': pass, 'email': email});
    if (data['message'] == 'site.success_login') {
      sharedPreferences.setString('id', data['data']['id'].toString());
      sharedPreferences.setString('token', data['data']['token']);
      Get.to(HomeScreen(),
          duration: const Duration(seconds: 1), transition: Transition.fade);
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(bottomMessage(
            title: 'Teddy',
            message: 'Your Email or Password is Incorrect',
            type: ContentType.failure));
    }

    return data;
  }

  Future signUp(
      {required String email,
      required String pass,
      required String contact,
      required String cPassword,
      required String name,
      required BuildContext context}) async {
    var data = await Crud.postRequest(signUpLink, {
      'password': pass,
      'email': email,
      'password_confirmation': cPassword,
      'contact': contact,
      'name': name,
    });
    if (data['message'] == 'site.success_register') {
      sharedPreferences.setString('id', data['data']['id'].toString());
      sharedPreferences.setString('token', data['data']['token']);
      Get.to(HomeScreen(),
          duration: const Duration(seconds: 1), transition: Transition.fade);
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(bottomMessage(
            title: 'Teddy',
            message: 'Your Email or Password is Incorrect',
            type: ContentType.failure));
    }

    return data;
  }

  Future checkUser() async {
    var data = await Crud.postRequest(checkUserLink, {
      'token': sharedPreferences.getString('token'),
    });
    return data;
  }
}

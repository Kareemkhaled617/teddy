import 'package:bubbletea/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart' as rive;

import '../animation_enum.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  rive.Artboard? riveArtboard;
  late rive.RiveAnimationController controllerIdle;
  late rive.RiveAnimationController controllerHandsUp;
  late rive.RiveAnimationController controllerHandsDown;
  late rive.RiveAnimationController controllerLookLeft;
  late rive.RiveAnimationController controllerLookRight;
  late rive.RiveAnimationController controllerSuccess;
  late rive.RiveAnimationController controllerFail;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String testEmail = "";
  String testPassword = "";
  final passwordFocusNode = FocusNode();
  AuthController authController = Get.put(AuthController());

  bool isLookingLeft = false;
  bool isLookingRight = false;

  void removeAllControllers() {
    riveArtboard?.artboard.removeController(controllerIdle);
    riveArtboard?.artboard.removeController(controllerHandsUp);
    riveArtboard?.artboard.removeController(controllerHandsDown);
    riveArtboard?.artboard.removeController(controllerLookLeft);
    riveArtboard?.artboard.removeController(controllerLookRight);
    riveArtboard?.artboard.removeController(controllerSuccess);
    riveArtboard?.artboard.removeController(controllerFail);
    isLookingLeft = false;
    isLookingRight = false;
  }

  void addIdleController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdle);
    debugPrint("idleee");
  }

  void addHandsUpController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsUp);
    debugPrint("hands up");
  }

  void addHandsDownController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerHandsDown);
    debugPrint("hands down");
  }

  void addSuccessController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerSuccess);
    debugPrint("Success");
  }

  void addFailController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerFail);
    debugPrint("Faillll");
  }

  void addLookRightController() {
    removeAllControllers();
    isLookingRight = true;
    riveArtboard?.artboard.addController(controllerLookRight);
    debugPrint("Righttt");
  }

  void addLookLeftController() {
    removeAllControllers();
    isLookingLeft = true;
    riveArtboard?.artboard.addController(controllerLookLeft);
    debugPrint("Leftttttt");
  }

  void checkForPasswordFocusNodeToChangeAnimationState() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        addHandsUpController();
      } else if (!passwordFocusNode.hasFocus) {
        addHandsDownController();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controllerIdle = rive.SimpleAnimation(AnimationEnum.idle.name);
    controllerHandsUp = rive.SimpleAnimation(AnimationEnum.Hands_up.name);
    controllerHandsDown = rive.SimpleAnimation(AnimationEnum.hands_down.name);
    controllerLookRight =
        rive.SimpleAnimation(AnimationEnum.Look_down_right.name);
    controllerLookLeft =
        rive.SimpleAnimation(AnimationEnum.Look_down_left.name);
    controllerSuccess = rive.SimpleAnimation(AnimationEnum.success.name);
    controllerFail = rive.SimpleAnimation(AnimationEnum.fail.name);

    rootBundle.load('assets/RiveAssets/login_animation.riv').then((data) {
      final file = rive.RiveFile.import(data);
      final artboard = file.mainArtboard;
      artboard.addController(controllerIdle);
      setState(() {
        riveArtboard = artboard;
      });
    });

    checkForPasswordFocusNodeToChangeAnimationState();
  }

  void validateEmailAndPassword() {
    Future.delayed(const Duration(seconds: 1), () {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();

        authController
            .login(email: testEmail, pass: testPassword, context: context)
            .then((value) {
          if (value['message'] == 'site.success_login') {
            addSuccessController();
          } else {
            addFailController();
          }
        });
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment(-0.5, -0.5),
                  colors: [Color(0xffFD7FA2), Color(0xffFFC400)])),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: riveArtboard == null
                      ? const SizedBox.shrink()
                      : rive.Rive(
                          artboard: riveArtboard!,
                        ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 24,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          // labelText: "Email",
                          // labelStyle: const TextStyle(color: Colors.black),
                          label: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Email",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  width: 8, color: Color(0xffFD7FA2))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  width: 1.5, color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Color(0xffFFC400))),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.red)),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? "Wrong email" : null,
                        onSaved: (val) {
                          testEmail = val!;
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty &&
                              value.length < 16 &&
                              !isLookingLeft) {
                            addLookLeftController();
                          } else if (value.isNotEmpty &&
                              value.length > 16 &&
                              !isLookingRight) {
                            addLookRightController();
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          // labelText: "Password",
                          label: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text("Password",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18)),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Color(0xffFD7FA2))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  width: 1.5, color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Color(0xffFFC400))),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.red)),
                        ),
                        focusNode: passwordFocusNode,
                        validator: (value) =>
                            value!.isEmpty ? "Wrong password" : null,
                        onSaved: (val) {
                          testPassword = val!;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xffFFC400,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                )),
                            onPressed: () {
                              passwordFocusNode.unfocus();
                              validateEmailAndPassword();
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 24,
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

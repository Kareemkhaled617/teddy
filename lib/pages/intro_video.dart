import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../main.dart';
import 'animation_auth/login/login_screen.dart';
import 'home/home_screen.dart';

class IntroVideo extends StatefulWidget {
  IntroVideo({Key? key}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<IntroVideo> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.asset('assets/intro.mp4');
    controller.initialize().then((value) => {
          controller.addListener(() {
            if (!controller.value.isPlaying &&
                controller.value.isInitialized &&
                (controller.value.duration == controller.value.position)) {
              sharedPreferences.getString('token') == null
                  ? Get.to(const LoginScreen(),
                      duration: const Duration(seconds: 1),
                      transition: Transition.fadeIn)
                  : Get.to(HomeScreen(),
                      duration: const Duration(seconds: 1),
                      transition: Transition.fadeIn);
            }
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow.shade400,
        extendBody: true,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xffFD7FA2), Color(0xffFFC400)])),
              child: Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller..play()),
                ),
              ),

              // FutureBuilder(
              //   future: homeController.getVideo(Get.locale.toString()),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       var data = snapshot.data as Map;
              //       VideoPlayerController controller = VideoPlayerController.asset(
              //           // 'http://168.119.119.249/${data['video']['path']}'
              //           Get.locale == const Locale('ar')
              //               ? 'assets/audio/intro_ar.mp4'
              //               : Get.locale == const Locale('fr')
              //                   ? 'assets/audio/intro_fn.mp4'
              //                   : 'assets/audio/intro_en.mp4');
              //       controller.initialize().then((value) => {
              //             controller.addListener(() {
              //               if (!controller.value.isPlaying &&
              //                   controller.value.isInitialized &&
              //                   (controller.value.duration ==
              //                       controller.value.position)) {
              //                 Get.off(const HomeLogin());
              //               }
              //             })
              //           });
              //       if (data['success'] == 'Success') {
              //         return Center(
              //           child: AspectRatio(
              //             aspectRatio: controller.value.aspectRatio,
              //             child: VideoPlayer(controller..play()),
              //           ),
              //         );
              //       } else {
              //         return const Center(
              //           child: Text('خطأ بتحميل الفديو'),
              //         );
              //       }
              //     } else {
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     }
              //   },
              // ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bubbletea/controller/user_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../details/components/custom_app_bar.dart';
import 'order_component.dart';

class MyOrdersDetails extends StatelessWidget {
  MyOrdersDetails({super.key, required this.categoryID});

  final String categoryID;
  final UserOrderController userOrderController =
      Get.put(UserOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const CustomAppBar(rating: 0.5),
        // child: Container(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: FutureBuilder(
            future: userOrderController.fetchUserOrdersDetails(categoryID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map categoryJuices = snapshot.data as Map;
                return ListView.builder(
                    itemCount: categoryJuices['data']['juice'].length,
                    itemBuilder: (context, index) => OrderComponent(
                        product: categoryJuices['data']['juice'][index]));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

import 'package:bubbletea/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cart/components/product_card.dart';
import '../details/components/custom_app_bar.dart';

class CategoryProducts extends StatelessWidget {
  CategoryProducts({super.key, required this.categoryID});

  final String categoryID;
  final HomeController homeController = Get.put(HomeController());

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
        child: FutureBuilder(
            future: homeController.fetchCategoryJuices(categoryID),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map categoryJuices = snapshot.data as Map;
                return ListView.builder(
                    itemCount: categoryJuices['data'].length,
                    itemBuilder: (context, index) =>
                        ProductCard(product: categoryJuices['data'][index]));
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

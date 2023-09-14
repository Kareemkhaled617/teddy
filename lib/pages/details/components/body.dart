import 'package:bubbletea/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/constants.dart';
import '../../../util/size_config.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  final product;

  Body({Key? key, required this.product}) : super(key: key);

  // HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print('**---------------------**********');
    print(product['adds']);
    return ListView(
      children: [
        ProductImages(product: product),
        ProductDescription(
          product: product,
          pressOnSeeMore: () {},
        ),
        TopRoundedContainer(
          color: const Color(0xFFF6F7F9),
          child: ColorDots(product: product),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap: () {},
            child: const Row(
              children: [
                Text(
                  "Addons",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kPrimaryColor),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
        GetBuilder<HomeController>(
          init: HomeController(),
          builder: (GetxController controller) => ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: product['adds'].length,
            itemBuilder: (context, index) {
              final add = product['adds'][index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xffffaf33), Color(0xffffcc3a)]),
                  ),
                  child: CheckboxListTile(
                    checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: Colors.white, width: 2)),
                    title: Text(
                      add['name'],
                      style: const TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      'Price: \$${double.parse(add['price']).toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w800),
                    ),
                    value: Get.find<HomeController>()
                        .itemExists(add['id'].toString()),
                    onChanged: (newValue) {
                      Get.find<HomeController>().addItem(add['id'].toString());
                    },
                  ),
                ),
              );
            },
          ),
        )

        // TopRoundedContainer(
        //   color: Colors.white,
        //   child: Padding(
        //     padding: EdgeInsets.only(
        //       left: SizeConfig.screenWidth * 0.15,
        //       right: SizeConfig.screenWidth * 0.15,
        //       bottom: getProportionateScreenWidth(40),
        //       top: getProportionateScreenWidth(15),
        //     ),
        //     child: DefaultButton(
        //       text: "Add To Cart",
        //       press: () {},
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

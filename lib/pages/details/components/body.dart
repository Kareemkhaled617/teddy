import 'package:animate_do/animate_do.dart';
import 'package:bubbletea/controller/home_controller.dart';
import 'package:bubbletea/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../util/constants.dart';
import '../../../util/size_config.dart';
import '../../cart/components/default_button.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatefulWidget {
  final product;

  Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isOpen = false;
  bool isOpen1 = false;
  bool isOpen2 = false;
  bool isOpen3 = false;
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print('**---------------------**********');
    print(widget.product['adds']);
    return Scaffold(
      body: ListView(
        children: [
          ProductImages(product: widget.product),
          const SizedBox(
            height: 16,
          ),
          ProductDescription(
            product: widget.product,
            pressOnSeeMore: () {},
          ),
          TopRoundedContainer(
            color: const Color(0xFFF6F7F9),
            child: ColorDots(product: widget.product),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "Addons",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kPrimaryColor),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  child: isOpen
                      ? const Icon(
                          Icons.arrow_drop_down,
                          size: 27,
                          color: kPrimaryColor,
                        )
                      : const Icon(
                          Icons.arrow_drop_up_outlined,
                          size: 27,
                          color: kPrimaryColor,
                        ),
                ),
              ],
            ),
          ),
          isOpen
              ? GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (GetxController controller) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.product['adds'].length,
                    itemBuilder: (context, index) {
                      final add = widget.product['adds'][index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: FadeInUp(
                          duration: const Duration(seconds: 1),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xffffaf33),
                                    Color(0xffffcc3a)
                                  ]),
                            ),
                            child: CheckboxListTile(
                              checkboxShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: const BorderSide(
                                      color: Colors.white, width: 2)),
                              title: Text(
                                add['name'],
                                style: const TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w800),
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
                                Get.find<HomeController>()
                                    .addItem(add['id'].toString());
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "Sugar",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kPrimaryColor),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isOpen1 = !isOpen1;
                    });
                  },
                  child: isOpen
                      ? const Icon(
                          Icons.arrow_drop_down,
                          size: 27,
                          color: kPrimaryColor,
                        )
                      : const Icon(
                          Icons.arrow_drop_up_outlined,
                          size: 27,
                          color: kPrimaryColor,
                        ),
                ),
              ],
            ),
          ),
          isOpen1
              ? GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (GetxController controller) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.product['sugar'].length,
                    itemBuilder: (context, index) {
                      final add = widget.product['sugar'][index];
                      return InkWell(
                        onTap: () {
                          Get.find<HomeController>()
                              .updateSugarId(sugar: add['id'].toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          child: FadeInUp(
                            duration: const Duration(seconds: 1),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Get.find<HomeController>().sugarId ==
                                        add['id'].toString()
                                    ? const Color(0xffffaf33)
                                    : Colors.grey,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    add['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "Ice",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kPrimaryColor),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isOpen2 = !isOpen2;
                    });
                  },
                  child: isOpen2
                      ? const Icon(
                          Icons.arrow_drop_down,
                          size: 27,
                          color: kPrimaryColor,
                        )
                      : const Icon(
                          Icons.arrow_drop_up_outlined,
                          size: 27,
                          color: kPrimaryColor,
                        ),
                ),
              ],
            ),
          ),
          isOpen2
              ? GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (GetxController controller) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.product['ice'].length,
                    itemBuilder: (context, index) {
                      final add = widget.product['ice'][index];
                      return InkWell(
                        onTap: () {
                          Get.find<HomeController>()
                              .updateIceId(ice: add['id'].toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          child: FadeInUp(
                            duration: const Duration(seconds: 1),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Get.find<HomeController>().iceId ==
                                        add['id'].toString()
                                    ? const Color(0xffffaf33)
                                    : Colors.grey,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    add['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  "Size",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: kPrimaryColor),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      isOpen3 = !isOpen3;
                    });
                  },
                  child: isOpen3
                      ? const Icon(
                          Icons.arrow_drop_down,
                          size: 27,
                          color: kPrimaryColor,
                        )
                      : const Icon(
                          Icons.arrow_drop_up_outlined,
                          size: 27,
                          color: kPrimaryColor,
                        ),
                ),
              ],
            ),
          ),
          isOpen3
              ? GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (GetxController controller) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.product['size'].length,
                    itemBuilder: (context, index) {
                      final add = widget.product['size'][index];
                      return InkWell(
                        onTap: () {
                          Get.find<HomeController>()
                              .updateSizeId(size: add['id'].toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          child: FadeInUp(
                            duration: const Duration(seconds: 1),
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Get.find<HomeController>().sizeId ==
                                        add['id'].toString()
                                    ? const Color(0xffffaf33)
                                    : Colors.grey,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    add['name'],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Container(),
          const SizedBox(
            height: 20,
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: DefaultButton(
          text: "Add To Cart",
          press: () {
            cartController.addToCart(
                userId: sharedPreferences.getString('id') ?? '',
                sugar: Get.find<HomeController>().sugarId,
                ice: Get.find<HomeController>().iceId,
                size: Get.find<HomeController>().sizeId,
                adds: Get.find<HomeController>().addons,
                quantity: Get.find<HomeController>().quantityId,
                juice: widget.product['id']);
          },
        ),
      ),
    );
  }
}

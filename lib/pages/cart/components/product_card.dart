import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/size_config.dart';
import '../../details/details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 200,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: () => Get.to(DetailsScreen(product: product['id'].toString()),
              duration: const Duration(seconds: 1),
              transition: Transition.fade),
          child: Container(
            // height: 270,
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xffffaf33), Color(0xffffcc3a)]),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product['name'] ?? '',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
                Hero(
                  tag: product['id'].toString(),
                  child: Image.network(
                    'https://teddy-pearl.net/${product['image']}',
                    width: 150,
                    height: 150,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "DHS ${'120'}",
                //       style: TextStyle(
                //         fontSize: getProportionateScreenWidth(18),
                //         fontWeight: FontWeight.w600,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

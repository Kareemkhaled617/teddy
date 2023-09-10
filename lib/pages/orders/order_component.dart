import 'package:flutter/material.dart';

import '../../../util/size_config.dart';

class OrderComponent extends StatelessWidget {
  const OrderComponent({
    Key? key,
    required this.product,
  }) : super(key: key);

  final product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
              product['juice_name'] ?? '',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),

            Image.network(
              'https://teddy-pearl.net/${product['juice_image']}',
              width: 150,
              height: 150,
            ),

            Text(
              'Quantity :  ${product['juice_quantity']}' ?? '',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
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
    );
  }
}

import 'package:flutter/material.dart';

import '../../../util/constants.dart';
import '../../../util/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final cart;

  @override
  Widget build(BuildContext context) {
    int selectedColor = 1;

    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://teddy-pearl.net/${cart['juice_image']}')),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffffaf33), Color(0xffffcc3a)]),
                borderRadius: BorderRadius.circular(15),
              ),
              // child: Image.asset(cart.product.images[0],fit: ,),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart['juice_name'],
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart['juice_price']}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text.rich(
                  TextSpan(
                    text: "Quantity : ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: "${cart['juice_quantity']}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Container(
            //       height: getProportionateScreenWidth(20),
            //       width: getProportionateScreenWidth(20),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         border: Border.all(color: Colors.black),
            //         boxShadow: [
            //           if (true)
            //             BoxShadow(
            //               offset: const Offset(0, 6),
            //               blurRadius: 10,
            //               color: const Color(0xFFB0B0B0).withOpacity(0.2),
            //             ),
            //         ],
            //       ),
            //       child: TextButton(
            //         style: TextButton.styleFrom(
            //           padding: EdgeInsets.zero,
            //           primary: kPrimaryColor,
            //           backgroundColor: Colors.white,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(40)),
            //         ),
            //         onPressed: () {
            //           selectedColor--;
            //         },
            //         child: const Icon(
            //           Icons.remove,
            //           size: 19,
            //         ),
            //       ),
            //     ),
            //     SizedBox(width: getProportionateScreenWidth(5)),
            //     Text(
            //       '$selectedColor',
            //       style: const TextStyle(
            //           fontWeight: FontWeight.w900, fontSize: 18),
            //     ),
            //     SizedBox(width: getProportionateScreenWidth(5)),
            //     Container(
            //       height: getProportionateScreenWidth(20),
            //       width: getProportionateScreenWidth(20),
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         border: Border.all(color: Colors.black),
            //         boxShadow: [
            //           if (true)
            //             BoxShadow(
            //               offset: const Offset(0, 6),
            //               blurRadius: 10,
            //               color: const Color(0xFFB0B0B0).withOpacity(0.2),
            //             ),
            //         ],
            //       ),
            //       child: TextButton(
            //         style: TextButton.styleFrom(
            //           padding: EdgeInsets.zero,
            //           primary: kPrimaryColor,
            //           backgroundColor: Colors.white,
            //           shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(40)),
            //         ),
            //         onPressed: () {
            //           selectedColor++;
            //         },
            //         child: const Icon(
            //           Icons.add,
            //           size: 19,
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        )
      ],
    );
  }
}

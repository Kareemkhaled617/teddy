import 'package:flutter/material.dart';

import '../../../util/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Text(
            'Play With BOOba',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(22),
                color: Colors.black,
                fontWeight: FontWeight.w600),
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Container(
                  // height: 90,
                  width: double.infinity,
                  margin: EdgeInsets.all(getProportionateScreenWidth(20)),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          Color(0xffF1DC8D),
                          Color(0xffDD9718),
                        ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Play Our Game',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Get',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Free Bubble Tea',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Mango milkshake is filled with\nimportant nutrients such as\niron, protein, and beta-carotene.',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(12),
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                  // Text.rich(
                  //   TextSpan(
                  //     style: TextStyle(color: Colors.white),
                  //     children: [
                  //       TextSpan(text: "Play Our Game\n"),
                  //       TextSpan(
                  //         text: "Cashback 20%",
                  //         style: TextStyle(
                  //           fontSize: getProportionateScreenWidth(24),
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Image(
                    image: AssetImage('assets/p1.png'),
                    height: 220,
                  )),
            ),
          ],
        ),
      ],
    );
  }
}

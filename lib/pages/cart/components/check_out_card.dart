import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../util/constants.dart';
import '../../../util/size_config.dart';
import 'default_button.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order instrustion',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Container(
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                onChanged: (value) => print(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(9)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Instrustion",
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                const Text("Add voucher code"),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    style: TextStyle(fontWeight: FontWeight.w900),
                    children: [
                      TextSpan(
                        text: "\$337.15",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bubbletea/pages/details/components/rounded_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/Product.dart';
import '../../../util/size_config.dart';
import '../../cart/components/default_button.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 1;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedIconBtn(
                icon: Icons.remove,
                press: () {
                  setState() {
                    selectedColor--;
                  }
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              Text(
                '$selectedColor',
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: true,
                press: () {
                  selectedColor++;
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 200,
            child: DefaultButton(
              text: "Go Talabat",
              press: () {
                _launchURL2(
                    Uri.parse('https://www.talabat.com/uae/teddy-pearl'));
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL2(Uri url) async {
    if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}

// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     Key? key,
//     required this.color,
//     this.isSelected = false,
//   }) : super(key: key);
//
//   final Color color;
//   final bool isSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 2),
//       padding: EdgeInsets.all(getProportionateScreenWidth(8)),
//       height: getProportionateScreenWidth(40),
//       width: getProportionateScreenWidth(40),
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         border:
//             Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
//         shape: BoxShape.circle,
//       ),
//       child: DecoratedBox(
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/Product.dart';
import '../../../util/constants.dart';
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
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            DetailsScreen.routeName,
            arguments: ProductDetailsArguments(product: product),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 270,
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
                      product.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Hero(
                      tag: product.id.toString(),
                      child: Image.asset(
                        product.images[0],
                        width: 150,
                        height: 150,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "DHS ${product.price}",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {},
                          child: Container(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(8)),
                            height: getProportionateScreenWidth(28),
                            width: getProportionateScreenWidth(28),
                            decoration: BoxDecoration(
                              color: product.isFavourite
                                  ? kPrimaryColor.withOpacity(0.15)
                                  : kSecondaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/Heart Icon_2.svg",
                              color: product.isFavourite
                                  ? const Color(0xFFFF4848)
                                  : const Color(0xFFDBDEE4),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

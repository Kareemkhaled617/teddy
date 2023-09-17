import 'package:bubbletea/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../util/size_config.dart';
import '../../category_products/category_products.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> categories = [
    //   {"icon": "assets/drinks/d1.png", "text": "Berry"},
    //   {"icon": "assets/drinks/d2.png", "text": "Mango"},
    //   {"icon": "assets/drinks/d3.png", "text": "Stawbbery"},
    //   {"icon": "assets/drinks/d4.png", "text": "Passion Love"},
    // ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: FutureBuilder(
        future: homeController.fetchCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map data = snapshot.data as Map;
            List categories = data['data'];
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...List.generate(
                    categories.length <= 4 ? categories.length : 4,
                    (index) => CategoryCard(
                      icon: "assets/drinks/d1.png",
                      text: categories[index]["name"],
                      press: () {
                        Get.to(CategoryProducts(
                          categoryID: categories[index]["id"].toString(),
                        ));
                      },
                    ),
                  ),
                  Container(
                    height: getProportionateScreenWidth(55),
                    width: getProportionateScreenWidth(55),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xffffcf3b),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'See\n All',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<void> _launchURL2(Uri url) async {
    if (await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 80,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(icon!)),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(
                      0xffFF9200), //                   <--- border color
                ),
              ),
              // child: Image.asset(icon!,fit: BoxFit.fill,),
            ),
            const SizedBox(height: 5),
            Text(
              text!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

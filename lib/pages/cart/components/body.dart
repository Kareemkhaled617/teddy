import 'package:bubbletea/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: cartController.fetchUserCart(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map cart = snapshot.data as Map;
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: cart['data']['juice'].length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(cart['data']['juice'][index]['cart_id'].toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    cartController
                        .deleteItemFromCart(
                            cart['data']['juice'][index]['cart_id'].toString())
                        .whenComplete(() {
                      setState(() {
                        // Remove the dismissed item from the list
                        cart['data']['juice'].removeAt(index);
                      });
                    });
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(cart: cart['data']['juice'][index]),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

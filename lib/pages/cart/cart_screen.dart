import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../util/constants.dart';
import '../../util/size_config.dart';
import 'components/cart_card.dart';
import 'components/default_button.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: FutureBuilder(
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
                    key:
                        Key(cart['data']['juice'][index]['cart_id'].toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      cartController
                          .deleteItemFromCart(cart['data']['juice'][index]
                                  ['cart_id']
                              .toString())
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
          }),
      bottomNavigationBar: FutureBuilder(
          future: cartController.fetchUserCart(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              Map cart = snapshot.data as Map;
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
                      // const Text(
                      //   'Order instrustion',
                      //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      // ),
                      // SizedBox(height: getProportionateScreenHeight(10)),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     color: kSecondaryColor.withOpacity(0.1),
                      //     border: Border.all(color: Colors.black),
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: TextField(
                      //     onChanged: (value) => print(value),
                      //     decoration: InputDecoration(
                      //       contentPadding: EdgeInsets.symmetric(
                      //           horizontal: getProportionateScreenWidth(20),
                      //           vertical: getProportionateScreenWidth(9)),
                      //       border: InputBorder.none,
                      //       focusedBorder: InputBorder.none,
                      //       enabledBorder: InputBorder.none,
                      //       hintText: "Instrustion",
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: getProportionateScreenHeight(20)),
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
                          Text.rich(
                            TextSpan(
                              text: "Total:\n",
                              style:
                                  const TextStyle(fontWeight: FontWeight.w900),
                              children: [
                                TextSpan(
                                  text: "\$ ${cart['data']['total']}",
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black),
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
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: const [
        CircleAvatar(
          radius: 50,
          backgroundColor: Color(0xffFFC400),
          child: Image(
            image: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/014/194/232/original/avatar-icon-human-a-person-s-badge-social-media-profile-symbol-the-symbol-of-a-person-vector.jpg'),
            fit: BoxFit.cover,
          ),
        )
      ],
      title: const Column(
        children: [
          Text(
            " The ",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "juicey",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
    );
  }
}

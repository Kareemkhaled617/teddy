import 'package:flutter/material.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar: const CheckoutCard(),
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
      title: Column(
        children: const [
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

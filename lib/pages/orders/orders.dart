import 'package:bubbletea/controller/user_order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/size_config.dart';
import '../details/components/custom_app_bar.dart';
import 'orders_details.dart';

class MyOrders extends StatelessWidget {
  MyOrders({super.key});

  final UserOrderController userOrderController =
      Get.put(UserOrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: const CustomAppBar(rating: 0.5),
        // child: Container(),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder(
            future: userOrderController.fetchUserOrders(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Map userOrders = snapshot.data as Map;
                return ListView.separated(
                  itemCount: userOrders['data'].length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Get.to(
                          MyOrdersDetails(
                            categoryID:
                                userOrders['data'][index]['id'].toString(),
                          ),
                          duration: const Duration(seconds: 1),
                          transition: Transition.fade);
                    },
                    child: Container(
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
                            'Order Code :  ${userOrders['data'][index]['transaction_id']}' ??
                                '',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Total :  ${userOrders['data'][index]['total']}' ??
                                '',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 12,
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}

import 'package:bubbletea/main.dart';
import 'package:get/get.dart';

import '../util/crud.dart';
import '../util/links.dart';

class UserOrderController extends GetxController {
  Future fetchUserOrders() async {
    Map orders = await Crud.postRequest(
        userOrdersLink, {'user_id': sharedPreferences.getString('id')});
    return orders;
  }

  Future fetchUserOrdersDetails(String orderID) async {
    Map orders = await Crud.postRequest(userOrdersLink,
        {'user_id': sharedPreferences.getString('id'), 'order_id': orderID});
    return orders;
  }
}

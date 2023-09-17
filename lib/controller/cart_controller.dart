import 'package:get/get.dart';

import '../main.dart';
import '../util/crud.dart';
import '../util/links.dart';

class CartController extends GetxController {
  Future addToCart({
    required String userId,
    required String sugar,
    required String ice,
    required String size,
    required String adds,
    required String quantity,
    required String juice,
  }) async {
    print({
      'user': userId,
      'sugar': sugar,
      'size': size,
      'adds': adds,
      'ice': ice,
      'quantity': quantity,
      'juice': juice,
      'basis': '',
    });
    var orders = await Crud.postRequest(addToCartLink, {
      'user': userId,
      'sugar': sugar,
      'size': size,
      'adds': adds,
      'ice': ice,
      'quantity': quantity,
      'juice': juice,
      'basis': '',
    });
    print('******************');
    print(orders);
    return orders;
  }

  Future fetchUserCart() async {
    Map userCart = await Crud.postRequest(
        userCartLink, {'user_id': sharedPreferences.getString('id')});
    return userCart;
  }

  Future deleteItemFromCart(String catID) async {
    Map userCart =
        await Crud.postRequest(deleteItemFromCartLink, {'cart_id': catID});
    return userCart;
  }

  Future checkOut(
      {required String branchId,
      required String message,
      required String success,
      required String total,
      required String userId,
      required String transactionId}) async {
    Map checkOut = await Crud.postRequest(deleteItemFromCartLink, {
      'branch_id': branchId,
      'message': message,
      'success': success,
      'total': total,
      'user_id': sharedPreferences.getString('id'),
      'transaction_id': transactionId,
    });
    return checkOut;
  }
}

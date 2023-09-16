import 'package:bubbletea/util/crud.dart';
import 'package:bubbletea/util/links.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List addons = [];
  String sugarId = '';
  String iceId = '';
  String sizeId = '';
  String quantityId = '';

  Future fetchCategory() async {
    Map category = await Crud.getRequest(categoryLink);
    return category;
  }

  Future fetchCategoryJuices(String categoryID) async {
    Map categoryJuices =
        await Crud.postRequest(categoryJuicesLink, {'category_id': categoryID});
    return categoryJuices;
  }

  Future fetchJuicesDetails(String id) async {
    Map juices = await Crud.postRequest(juicesDetailsLink, {'id': id});
    return juices;
  }

  void addItem(String itemName) {
    // Check if the item already exists
    final existingItem = addons.firstWhere(
      (item) => item == itemName,
      orElse: () => null,
    );

    if (existingItem == null) {
      // Item doesn't exist, add it
      addons.add(itemName);
    } else {
      // Item already exists, remove it
      addons.remove(existingItem);
    }
    // Call update to notify listeners of changes (if you're using GetX).
    // If you're not using GetX, you can update your UI as needed.
    update();
  }

  bool itemExists(String itemName) {
    return addons.any((item) => item == itemName);
  }

  updateSugarId({required String sugar}) {
    sugarId = sugar;
    update();
  }

  updateIceId({required String ice}) {
    iceId = ice;
    update();
  }

  updateSizeId({required String size}) {
    sizeId = size;
    update();
  }

  updateQuantity({required String quantity}) {
    quantityId = quantity;
    update();
  }
}

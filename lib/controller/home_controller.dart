import 'package:bubbletea/util/crud.dart';
import 'package:bubbletea/util/links.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
}

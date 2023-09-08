import 'package:bubbletea/util/crud.dart';
import 'package:bubbletea/util/links.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future fetchCategory() async {
    Map category = await Crud.getRequest(categoryLink);
    return category;
  }
}

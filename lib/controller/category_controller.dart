// ignore_for_file: depend_on_referenced_packages

import 'package:test_ecommerce/service/category_service.dart';

import 'loader_controller.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());

  List<dynamic> categoryList = [];
  @override
  void onInit() {
    super.onInit();
    fetchModelsList();
  }

  void fetchModelsList() async {
    loaderController.loading(true);

    var getItems = await CategoryService().getAllCategories();
    categoryList = getItems;

    print('categoryList is $categoryList');

    loaderController.loading(false);
    update();
    // return productsList;
  }
}

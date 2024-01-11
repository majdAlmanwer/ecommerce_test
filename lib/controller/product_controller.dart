// ignore_for_file: depend_on_referenced_packages

import 'package:test_ecommerce/model/products_model.dart';
import 'package:test_ecommerce/service/product_service.dart';
import 'loader_controller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());

  // ProductListModel allProductList = ProductListModel();
  List<Products_Model> allProductList = [];
  List<Products_Model> productListByCategory = [];
  @override
  void onInit() {
    super.onInit();
    fetchAllProductList();
  }

  void fetchAllProductList() async {
    loaderController.loading(true);
    var getItems = await ProductService().getAllProducts();
    allProductList = getItems.data!;
    print('categoryList is ${allProductList.length}');
    loaderController.loading(false);
    update();
    // return productsList;
  }

  Future<void> fetchProductListByCategory(String category) async {
    loaderController.loading(true);
    var getItems = await ProductService().getProductByCategory(category);
    productListByCategory = getItems.data!;
    print('categoryList is ${productListByCategory.length}');
    loaderController.loading(false);
    update();
    // return productsList;
  }
}

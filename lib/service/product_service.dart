import 'package:test_ecommerce/model/products_model.dart';

import '../api/api.dart';
import '../controller/loader_controller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class ProductService {
  static ProductService? _instance;

  var dio = Dio();
  factory ProductService() => _instance ??= ProductService._();

  ProductService._();

  LoaderController loaderController = Get.put(LoaderController());
  Future<ProductListModel> getAllProducts() async {
    loaderController.loading(true);
    var response = await Api().dio.get('products');
    loaderController.loading(false);
    return ProductListModel.fromJson(response.data);
  }

  Future<ProductListModel> getProductByCategory(String category) async {
    loaderController.loading(true);
    var response = await Api().dio.get('products/category/$category');
    loaderController.loading(false);
    return ProductListModel.fromJson(response.data);
  }
}

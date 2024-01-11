import '../api/api.dart';
import '../controller/loader_controller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class CategoryService {
  static CategoryService? _instance;

  var dio = Dio();
  factory CategoryService() => _instance ??= CategoryService._();

  CategoryService._();

  LoaderController loaderController = Get.put(LoaderController());
  Future<dynamic> getAllCategories() async {
    loaderController.loading(true);
    var response = await Api().dio.get('products/categories');
    loaderController.loading(false);
    return response.data;
  }
}

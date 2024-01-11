// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:test_ecommerce/routes/routes.dart';
import 'package:test_ecommerce/service/auth_service.dart';
import 'package:dio/dio.dart';
import '../widgets/custom_snack_bar.dart';
import 'loader_controller.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  LoaderController loaderController = Get.put(LoaderController());

  // ProductListModel allProductList = ProductListModel();

  @override
  void onInit() {
    super.onInit();
  }

  Future<dynamic> login(String email, String password) async {
    loaderController.loading(true);
    var data = {"username": email, "password": password};
    try {
      var token = await AuthService().loginApi(data);

      print('$token');

      Get.showSnackbar(CustomSnackBar(
        onTap: () {},
        message: 'Login Successful',
      ));
      update();
      Get.offAllNamed(AppRoutes.homepage);
    } catch (e) {
      if (e is DioException) {
        log(e.toString());
      } else {
        print('errorrrrrr${e.toString()}');
      }
    }

    loaderController.loading(false);
  }
}

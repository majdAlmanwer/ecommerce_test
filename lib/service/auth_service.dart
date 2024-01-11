// ignore_for_file: depend_on_referenced_packages

import '../api/api.dart';
import '../controller/loader_controller.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class AuthService {
  static AuthService? _instance;

  var dio = Dio();
  factory AuthService() => _instance ??= AuthService._();

  AuthService._();

  LoaderController loaderController = Get.put(LoaderController());
  Future<dynamic> loginApi(dynamic data) async {
    loaderController.loading(true);
    var response = await Api().dio.post('auth/login', data: data);
    loaderController.loading(false);
    return response.data;
  }
}

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce/routes/app_pages.dart';
import 'package:test_ecommerce/routes/routes.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  ////// app credencial //////
  ////// username: "mor_2314"////
  /////  password: "83r5^_" /////
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginscreen,
      getPages: pages,
      title: 'test_Ecommerce',
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      theme: ThemeData(),
    );
  }
}

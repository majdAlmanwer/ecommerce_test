// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:get/get.dart';
import 'package:test_ecommerce/routes/routes.dart';
import 'package:test_ecommerce/screen/product_list/product_list_screen.dart';
import '../screen/auth/login/login_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/product_details/product_details_screen.dart';

final pages = <GetPage>[
  GetPage(
    name: AppRoutes.homepage,
    page: () => Home_Screen(),
  ),
  GetPage(
    name: AppRoutes.productdetails,
    page: () => DetailsScreen(),
  ),
  GetPage(
    name: AppRoutes.productlistscreen,
    page: () => ProductScreenList(),
  ),
  GetPage(
    name: AppRoutes.loginscreen,
    page: () => SignInScreen(),
  ),
];

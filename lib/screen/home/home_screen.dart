// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors, depend_on_referenced_packages, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/category_controller.dart';
import 'package:test_ecommerce/controller/product_controller.dart';
import 'package:test_ecommerce/screen/add_edit_product/add_product/add_product_screen.dart';
import 'package:test_ecommerce/utils/enums.dart';
import 'package:test_ecommerce/utils/style.dart';
import 'package:test_ecommerce/widgets/custom_bottom_nav_bar.dart';
import 'package:get/get.dart';
import 'widget/home_body.dart';

class Home_Screen extends StatefulWidget {
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final categoryController = Get.put(CategoryController());
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddProductScreen());
          // showDialog(
          //   barrierDismissible: true,
          //   context: context,
          //   builder: (BuildContext context) {
          //     return CustomAlertDialog();
          //   },
          // );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}

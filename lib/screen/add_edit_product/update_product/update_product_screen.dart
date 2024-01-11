// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce/screen/add_edit_product/update_product/widget/update_product_body.dart';

class UpdateProductScreen extends StatelessWidget {
  UpdateProductScreen({super.key});
  final product = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: UpdateProductBody(
        product: product['product'],
      ),
    ));
  }
}

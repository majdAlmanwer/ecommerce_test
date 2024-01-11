// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/cart_controller.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';

import 'cart_card.dart';

class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  final CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.symmetric(horizontal: getPercentScreenWidth(1)),
        child: ListView.builder(
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CartCard(
              cart: controller.cartItems[index],
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}

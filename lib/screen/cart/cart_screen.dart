// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_ecommerce/screen/cart/widget/cart_body.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import '../../controller/cart_controller.dart';
import '../../utils/style.dart';
import 'widget/check_out_card.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: CartBody(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: getPercentScreenHeight(1),
          ),
          GetBuilder<CartController>(
            builder: (controller) => Text(
              "${controller.cartItems.length} items",
              // style: Theme.of(context).textTheme.,
              style: TextStyle(color: kTextColor, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

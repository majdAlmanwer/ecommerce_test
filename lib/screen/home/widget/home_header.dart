// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/cart_controller.dart';
import 'package:test_ecommerce/screen/cart/cart_screen.dart';
import 'package:test_ecommerce/screen/home/widget/icon_botton_counter.dart';
import 'package:test_ecommerce/screen/home/widget/search_field.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getPercentScreenWidth(1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          GetBuilder<CartController>(
            builder: (controller) => IconBtnWithCounter(
              widget: Icon(Icons.shopping_cart),
              press: () {
                Get.to(CartScreen());
              },
              numOfitem: controller.cartItems.length,
            ),
          ),
          IconBtnWithCounter(
            widget: const Icon(Icons.notifications),
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}

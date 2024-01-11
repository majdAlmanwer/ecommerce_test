// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/cart_controller.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';
import '../../../utils/style.dart';
import '../../../widgets/custom_snack_bar.dart';
import '../../../widgets/df_button.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(
          vertical: getPercentScreenWidth(5),
          horizontal: getPercentScreenWidth(3),
        ),
        // height: 174,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getPercentScreenHeight(15),
                  width: getPercentScreenWidth(15),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.receipt_sharp),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getPercentScreenHeight(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$${controller.grandTotal.ceilToDouble()}",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getPercentScreenWidth(55),
                  child: DefaultButton(
                    text: "Check Out",
                    press: () async {
                      Get.showSnackbar(CustomSnackBar(
                        onTap: () {},
                        message: 'Your order has been sent successfully',
                      ));
                      controller.endOrder();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

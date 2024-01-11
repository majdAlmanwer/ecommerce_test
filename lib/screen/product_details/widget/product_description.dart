// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_ecommerce/screen/add_edit_product/update_product/update_product_screen.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';
import '../../../utils/style.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: getPercentScreenHeight(2),
            left: getPercentScreenWidth(4),
            right: getPercentScreenWidth(4),
          ),
          child: Text(
            product.title,
            style: headingStyle,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getPercentScreenHeight(2),
            left: getPercentScreenWidth(4),
            right: getPercentScreenWidth(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product.price}",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(UpdateProductScreen(),
                      arguments: {'product': product});
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: kPrimaryColor,
                    ),
                    SizedBox(
                      width: getPercentScreenWidth(1),
                    ),
                    Text(
                      "Edit Product",
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: getPercentScreenHeight(4),
            left: getPercentScreenWidth(4),
            right: getPercentScreenWidth(4),
          ),
          child: Text(
            product.description,
            maxLines: 5,
            style: TextStyle(color: kTextColor),
          ),
        ),
      ],
    );
  }
}

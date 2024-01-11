// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_ecommerce/model/cart_model.dart';
import 'package:test_ecommerce/screen/product_details/widget/product_image.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';
import '../../../controller/cart_controller.dart';
import '../../../widgets/df_button.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';

class Body extends StatefulWidget {
  final product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: getPercentScreenWidth(8),
                          right: getPercentScreenWidth(8),
                          bottom: getPercentScreenWidth(1),
                          top: getPercentScreenWidth(1),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            cartController.addItemToCart(CartModel(
                              unitPrice: widget.product.price,
                              productId: widget.product.id,
                              itemImage: widget.product.image,
                              itemName: widget.product.title,
                            ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

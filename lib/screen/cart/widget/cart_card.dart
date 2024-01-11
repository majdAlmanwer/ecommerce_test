// ignore_for_file: must_be_immutable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/cart_controller.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';
import '../../../utils/style.dart';

class CartCard extends StatefulWidget {
  CartCard({Key? key, required this.cart, required this.index})
      : super(key: key);

  final cart;
  int index;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 0.88,
                child: Container(
                  padding: EdgeInsets.all(getPercentScreenWidth(2)),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.network(widget.cart.itemImage),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: getPercentScreenWidth(65),
                  child: Text(
                    widget.cart.itemName,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: getPercentScreenWidth(25),
                      child: Text.rich(
                        TextSpan(
                          text: "\$${widget.cart.unitPrice}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: kPrimaryColor),
                          children: [
                            TextSpan(
                                text: " x${widget.cart.quantity}",
                                style: TextStyle(color: kTextColor)),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: getPercentScreenWidth(6),
                    // ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.increaseQtyOfSelectedItemInCart(
                                  widget.index, widget.cart);
                              print('addddd');
                            },
                            icon: const Icon(
                              Icons.add_circle_outline_rounded,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              controller.decreaseQtyOfSelectedItemInCart(
                                  widget.index, widget.cart);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline_rounded,
                              color: kPrimaryColor,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              controller
                                  .removeSelectedItemFromCart(widget.index);
                              print('removed');
                            },
                            icon: const Icon(
                              Icons.delete_forever_outlined,
                              color: kTextColor,
                              size: 30,
                            )),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

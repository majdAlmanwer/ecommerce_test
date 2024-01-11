// ignore_for_file: depend_on_referenced_packages, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final num rating;

  CustomAppBar({required this.rating});

  @override
  // AppBar().preferredSize.height provide us the height that appy on our app bar
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.all(
              getPercentScreenWidth(3),
            ),
            child: Row(children: [
              SizedBox(
                height: getPercentScreenHeight(5),
                width: getPercentScreenHeight(5),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => Get.back(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      "$rating",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 25,
                    ),
                  ],
                ),
              ),
            ])));
  }
}

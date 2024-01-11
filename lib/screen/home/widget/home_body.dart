// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_ecommerce/screen/home/widget/categories_widget.dart';
import 'package:test_ecommerce/screen/home/widget/home_header.dart';
import 'package:test_ecommerce/screen/home/widget/popular_products.dart';
import 'package:test_ecommerce/screen/home/widget/special_offers.dart';
import 'package:test_ecommerce/widgets/banner_widget.dart';

import '../../../utils/size_config.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: getPercentScreenHeight(100),
        child: Column(
          children: [
            SizedBox(height: getPercentScreenHeight(2)),
            HomeHeader(),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: getPercentScreenHeight(2)),
                  BannerWidget(),
                  Categories(),
                  SpecialOffers(),
                  SizedBox(height: getPercentScreenHeight(2)),
                  PopularProducts(),
                  SizedBox(height: getPercentScreenHeight(2)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

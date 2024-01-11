// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/loader_controller.dart';
import 'package:test_ecommerce/controller/product_controller.dart';
import 'package:test_ecommerce/screen/home/widget/section_title.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:test_ecommerce/widgets/product_card.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce/widgets/shimmer_loader_product.dart';

import '../../../routes/routes.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    LoaderController loaderController = Get.put(LoaderController());
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPercentScreenWidth(2)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getPercentScreenWidth(2)),
        GetBuilder<ProductController>(
          builder: (controller) => loaderController.loading.value
              ? ShimmerLoader()
              : SizedBox(
                  height: getPercentScreenWidth(70),
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: productController.allProductList.length,
                    itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.productdetails, arguments: {
                            'product': productController.allProductList[index]
                          });
                        },
                        child: ProductCard(
                            product: productController.allProductList[index])),
                  ),
                ),
        )
      ],
    );
  }
}

// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/loader_controller.dart';
import 'package:test_ecommerce/routes/routes.dart';
import 'package:test_ecommerce/screen/home/widget/section_title.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce/widgets/shimmer_loader_product.dart';
import '../../../controller/product_controller.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    LoaderController loaderController = Get.put(LoaderController());
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getPercentScreenWidth(2)),
          child: SectionTitle(
            title: "Special for you",
            press: () {},
          ),
        ),
        SizedBox(height: getPercentScreenHeight(2)),
        GetBuilder<ProductController>(
          builder: (controller) => loaderController.loading.value
              ? ShimmerLoader()
              : SizedBox(
                  height: getPercentScreenWidth(40),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: controller.allProductList.length,
                    itemBuilder: (context, index) => SpecialOfferCard(
                      category: controller.allProductList[index].category,
                      press: () {
                        Get.toNamed(AppRoutes.productdetails, arguments: {
                          'product': controller.allProductList[index]
                        });
                      },
                      image: controller.allProductList[index].image,
                      name: controller.allProductList[index].title,
                    ),
                  ),
                ),
        )
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    this.image,
    this.name,
    required this.press,
  }) : super(key: key);

  final String? category, image, name;

  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getPercentScreenWidth(2)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getPercentScreenWidth(42),
          height: getPercentScreenWidth(40),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                image == null || image!.isEmpty
                    ? Container()
                    : Image.network(
                        image!,
                        fit: BoxFit.cover,
                      ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF343434).withOpacity(0.9),
                        const Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getPercentScreenWidth(2.0),
                    vertical: getPercentScreenWidth(2),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getPercentScreenWidth(5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "$name\n",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: getPercentScreenWidth(3),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

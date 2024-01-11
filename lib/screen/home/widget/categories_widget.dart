// ignore_for_file: prefer_const_constructors, unused_local_variable, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/category_controller.dart';
import 'package:test_ecommerce/controller/loader_controller.dart';
import 'package:test_ecommerce/controller/product_controller.dart';
import 'package:test_ecommerce/screen/product_list/product_list_screen.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce/widgets/shimmer_loader_category.dart';
import '../../../utils/style.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.find();
    ProductController productController = Get.put(ProductController());
    LoaderController loaderController = Get.put(LoaderController());
    return Padding(
      padding: EdgeInsets.all(getPercentScreenHeight(1)),
      child: GetBuilder<CategoryController>(
        builder: (controller) => loaderController.loading.value
            ? ShimmerLoaderCategory()
            : SizedBox(
                height: getPercentScreenHeight(18),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemExtent: getPercentScreenWidth(23),
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) => CategoryCard(
                    widget: Icon(
                      Icons.category_outlined,
                      color: kPrimaryColor,
                      size: getPercentScreenWidth(10),
                    ),
                    text: controller.categoryList[index],
                    press: () {
                      Get.showOverlay(
                          asyncFunction: () async {
                            await productController.fetchProductListByCategory(
                                controller.categoryList[index]);
                          },
                          loadingWidget: Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          )).then((value) => Get.to(ProductScreenList()));
                    },
                  ),
                ),
              ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.widget,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? text;
  final Widget widget;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        // width: getPercentScreenWidth(25),
        // height: getPercentScreenHeight(15),
        child: Column(
          children: [
            Container(
              height: getPercentScreenWidth(20),
              width: getPercentScreenWidth(20),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: widget,
            ),
            SizedBox(height: 5),
            Text(text!, style: headingStyle, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}

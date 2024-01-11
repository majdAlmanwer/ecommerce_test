// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce/controller/product_controller.dart';
import '../../routes/routes.dart';
import '../../utils/size_config.dart';
import '../../utils/style.dart';
import '../../widgets/title_row.dart';
import '../home/widget/icon_botton_counter.dart';
import '../home/widget/search_field.dart';

class ProductListBody extends StatefulWidget {
  ProductListBody({
    super.key,
  });

  @override
  State<ProductListBody> createState() => _ProductListBodyState();
}

class _ProductListBodyState extends State<ProductListBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find();
    return Column(
      children: [
        TitleRow(
          title: 'Products',
          widget: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Get.back();
              }),
        ),
        Padding(
          padding: EdgeInsets.all(getPercentScreenWidth(3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchField(),
              IconBtnWithCounter(widget: Icon(Icons.sort), press: () {}
                  // Navigator.pushNamed(context, CartScreen.routeName),
                  ),
              IconBtnWithCounter(
                widget: const Icon(Icons.filter_alt),
                numOfitem: 3,
                press: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                color: kSecondaryColor.withOpacity(0.1),
                padding: EdgeInsets.only(
                    left: getPercentScreenWidth(2),
                    right: getPercentScreenWidth(2)),
                height: getPercentScreenHeight(90),
                width: getPercentScreenWidth(100),
                child: productController.productListByCategory.isEmpty
                    ? Center(
                        child: Text('No Product'.tr,
                            style: const TextStyle(
                              fontSize: 22,
                              color: kPrimaryColor,
                              fontFamily: 'Muli',
                            )),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          mainAxisExtent: getPercentScreenHeight(40),
                          mainAxisSpacing: 1.0,
                        ),
                        itemCount:
                            productController.productListByCategory.length,
                        itemBuilder: (ctx, int index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.productdetails, arguments: {
                                'product': productController
                                    .productListByCategory[index]
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                        height: getPercentScreenHeight(20),
                                        width: getPercentScreenWidth(40),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: productController
                                                .productListByCategory[index]
                                                .image!
                                                .isNotEmpty
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  "${productController.productListByCategory[index].image}",
                                                  fit: BoxFit.fill,
                                                ),
                                              )
                                            : Container())
                                    .paddingAll(getPercentScreenWidth(1)),
                                Text(
                                    '${productController.productListByCategory[index].title}',
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'Muli',
                                    )).paddingAll(getPercentScreenWidth(1)),
                                Text(
                                        'SP ' +
                                            '${productController.productListByCategory[index].price} ',
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: kPrimaryColor,
                                            fontFamily: 'Muli'))
                                    .paddingAll(getPercentScreenWidth(1))
                              ],
                            ),
                          );
                        },
                      ).paddingOnly(bottom: getPercentScreenHeight(8)),
              ),
            ],
          )),
        ),
      ],
    );
  }
}

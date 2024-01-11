// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce/routes/routes.dart';
import 'package:test_ecommerce/utils/style.dart';
import '../../../../controller/category_controller.dart';
import '../../../../controller/image_picker_controller.dart';
import '../../../../utils/size_config.dart';
import '../../../../widgets/custom_snack_bar.dart';
import '../../../../widgets/df_button.dart';
import '../../../../widgets/title_row.dart';
import '../../add_product/widget/drop_down_list.dart';
import '../../add_product/widget/image_select.dart';

class UpdateProductBody extends StatefulWidget {
  const UpdateProductBody({super.key, required this.product});
  final product;
  @override
  State<UpdateProductBody> createState() => _UpdateProductBodyState();
}

class _UpdateProductBodyState extends State<UpdateProductBody> {
  final imagePickerController = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.find();
    final priceController =
        TextEditingController(text: widget.product.price.toString());
    final nameController = TextEditingController(text: widget.product.title);
    final descriptionController =
        TextEditingController(text: widget.product.description);

    return Column(
      children: [
        TitleRow(
            widget: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: 'Add Your Product'.tr),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            height: getPercentScreenHeight(100),
            width: getPercentScreenWidth(100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: getPercentScreenHeight(25),
                    width: getPercentScreenWidth(100),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${'Images'.tr} : ',
                              style: const TextStyle(
                                  fontFamily: 'segoeuiBold',
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                            Text(
                              ' Add Images Here'.tr,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontFamily: 'segoeui',
                                  // fontSize: 12,

                                  color: Colors.black54),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getPercentScreenHeight(1),
                        ),
                        InkWell(
                          onTap: () async {
                            Get.bottomSheet(
                                backgroundColor: Colors.white,
                                isDismissible: true,
                                shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.white70, width: 1),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24)),
                                ),
                                ImageSelectDialog());
                          },
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                                height: getPercentScreenHeight(18),
                                width: getPercentScreenWidth(30),
                                child: Center(
                                  child: Icon(
                                    Icons.add_a_photo,
                                    size: getPercentScreenHeight(6),
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                      height: getPercentScreenHeight(18),
                                      width: getPercentScreenWidth(28),
                                      child:
                                          Image.network(widget.product.image)),
                                  SizedBox(
                                    height: getPercentScreenHeight(18),
                                    width: getPercentScreenWidth(35),
                                    child: GetBuilder<ImagePickerController>(
                                      builder: (controller) => ListView.builder(
                                          physics:
                                              AlwaysScrollableScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: controller.images.length,
                                          itemBuilder: (context, index) =>
                                              controller.images.isEmpty
                                                  ? Container(
                                                      height:
                                                          getPercentScreenHeight(
                                                              18),
                                                      width:
                                                          getPercentScreenWidth(
                                                              25),
                                                      // color: Colors.amber,
                                                    )
                                                  : Stack(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Image.file(
                                                              height:
                                                                  getPercentScreenHeight(
                                                                      18),
                                                              width:
                                                                  getPercentScreenWidth(
                                                                      30),
                                                              File(controller
                                                                  .images[index]
                                                                  .path)),
                                                        ),
                                                        Positioned(
                                                            top: 1,
                                                            right: 6,
                                                            child: InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    controller
                                                                        .images
                                                                        .removeAt(
                                                                            index);
                                                                  });
                                                                },
                                                                child:
                                                                    const Icon(
                                                                  Icons
                                                                      .remove_circle,
                                                                  color:
                                                                      kPrimaryColor,
                                                                ))),
                                                      ],
                                                    )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getPercentScreenHeight(16),
                    width: getPercentScreenWidth(100),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'Product Name'.tr} : ',
                          style: const TextStyle(
                              fontFamily: 'segoeuiBold',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            controller: nameController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              hintText: 'Product Name'.tr,
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'segoeui',
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getPercentScreenHeight(16),
                    width: getPercentScreenWidth(100),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'Description'.tr} : ',
                          style: const TextStyle(
                              fontFamily: 'segoeuiBold',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              hintText: 'Product Description'.tr,
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'segoeui',
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getPercentScreenHeight(16),
                    width: getPercentScreenWidth(100),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'Price'.tr} : ',
                          style: const TextStyle(
                              fontFamily: 'segoeuiBold',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: TextFormField(
                            controller: priceController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              hintText: 'Product Price'.tr,
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'segoeui',
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: getPercentScreenHeight(18),
                    width: getPercentScreenWidth(100),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${'Categories'.tr} : ',
                          style: const TextStyle(
                              fontFamily: 'segoeuiBold',
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        DropDownList(
                          list: categoryController.categoryList,
                          category: widget.product.category,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getPercentScreenWidth(50),
                    child: DefaultButton(
                      press: () {
                        Get.showSnackbar(CustomSnackBar(
                          onTap: () {},
                          message: 'Request Was Submitted Successfully',
                        ));
                        Get.offNamed(AppRoutes.homepage);
                      },
                      text: 'Update Product',
                    ),
                  )
                ],
              ).paddingOnly(
                  bottom: getPercentScreenHeight(2),
                  top: getPercentScreenHeight(1)),
            ),
          ),
        ),
      ],
    );
  }
}

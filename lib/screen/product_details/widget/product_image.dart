import 'package:flutter/material.dart';
import 'package:test_ecommerce/utils/size_config.dart';

import '../../../utils/style.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  // int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: defaultDuration,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      height: getPercentScreenHeight(45),
      width: getPercentScreenWidth(100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(widget.product.image),
    );
  }

  // GestureDetector buildSmallProductPreview(int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedImage = index;
  //       });
  //     },
  //     child: AnimatedContainer(
  //       duration: defaultDuration,
  //       margin: EdgeInsets.only(right: 15),
  //       padding: EdgeInsets.all(8),
  //       height: getPercentScreenHeight(48),
  //       width: getPercentScreenWidth(100),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(
  //             color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
  //       ),
  //       child: Image.network(widget.product.image[index]),
  //     ),
  //   );
  // }
}

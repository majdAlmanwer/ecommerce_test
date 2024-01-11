import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import 'product_list_body.dart';

class ProductScreenList extends StatefulWidget {
  const ProductScreenList({super.key});

  @override
  State<ProductScreenList> createState() => _ProductScreenListState();
}

class _ProductScreenListState extends State<ProductScreenList> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: Scaffold(
        body: ProductListBody(),
      ),
    );
  }
}

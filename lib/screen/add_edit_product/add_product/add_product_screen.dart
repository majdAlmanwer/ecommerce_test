// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import 'widget/add_product_body.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: AddProductBody(),
    ));
  }
}

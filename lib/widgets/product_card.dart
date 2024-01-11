import 'package:flutter/material.dart';
import 'package:test_ecommerce/model/products_model.dart';
import 'package:test_ecommerce/utils/size_config.dart';

import '../utils/style.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 42,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Products_Model product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getPercentScreenWidth(2)),
      child: SizedBox(
        width: getPercentScreenWidth(width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: EdgeInsets.all(getPercentScreenWidth(2)),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Hero(
                  tag: product.id.toString(),
                  child: Image.network(
                    product.image!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              product.title!,
              style: TextStyle(color: Colors.black),
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

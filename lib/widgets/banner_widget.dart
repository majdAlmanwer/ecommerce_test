// ignore_for_file: depend_on_referenced_packages

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/size_config.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List banner_image = [
      'assets/images/Image Banner 2.png',
      'assets/images/Image Banner 3.png'
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: getPercentScreenHeight(22),
            ),
            items: banner_image.map((i) {
              return Stack(
                children: [
                  Image.asset(
                    '${i}',
                    fit: BoxFit.contain,
                    width: getPercentScreenWidth(100),
                  ),
                ],
              );
            }).toList()

            // : List.empty(),
            ),
      ),
    );
  }
}

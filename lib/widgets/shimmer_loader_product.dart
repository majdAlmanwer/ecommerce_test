// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/size_config.dart';
import 'package:fade_shimmer/fade_shimmer.dart';

class ShimmerLoader extends StatefulWidget {
  const ShimmerLoader({super.key});

  @override
  State<ShimmerLoader> createState() => _ShimmerLoaderState();
}

class _ShimmerLoaderState extends State<ShimmerLoader> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SizedBox(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeShimmer(
                height: 120,
                width: 120,
                radius: 12,
                millisecondsDelay: 100,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[900],
                highlightColor: Colors.grey[800],
              ),
              const SizedBox(
                height: 8,
              ),
              FadeShimmer(
                height: 12,
                millisecondsDelay: 200,
                width: 120,
                radius: 4,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[900],
                highlightColor: Colors.grey[800],
              ),
              const SizedBox(
                height: 8,
              ),
              FadeShimmer(
                height: 10,
                millisecondsDelay: 200,
                width: 60,
                radius: 4,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[900],
                highlightColor: Colors.grey[800],
              ),
            ],
          ),
          // SizedBox(
          //   width: 30,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeShimmer(
                height: 120,
                width: 120,
                radius: 4,
                millisecondsDelay: 100,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[900],
                highlightColor: Colors.grey[800],
              ),
              const SizedBox(
                height: 8,
              ),
              FadeShimmer(
                height: 12,
                millisecondsDelay: 200,
                width: 120,
                radius: 4,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[900],
                highlightColor: Colors.grey[800],
              ),
              const SizedBox(
                height: 8,
              ),
              FadeShimmer(
                height: 10,
                millisecondsDelay: 200,
                width: 60,
                radius: 4,
                fadeTheme: FadeTheme.light,
                baseColor: Colors.grey[900],
                highlightColor: Colors.grey[800],
              ),
            ],
          ),
        ],
      ),
    )).paddingOnly(top: 8);
  }
}

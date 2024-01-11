// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/style.dart';

class CustomSnackBar extends GetSnackBar {
  CustomSnackBar({Key? key, required Function onTap, required String message})
      : super(
          key: key,
          onTap: (snack) => onTap,
          titleText: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(
                Icons.done_outline_sharp,
                color: Colors.blue,
                size: 30,
              ),
              Text(
                message.tr,
                style: const TextStyle(
                  fontFamily: 'Baloo',
                  fontSize: 15,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          messageText: Text(''.tr),
          borderRadius: 15.0,
          duration: const Duration(seconds: 2),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          snackPosition: SnackPosition.TOP,
          backgroundColor: kPrimaryLightColor,
        );
}

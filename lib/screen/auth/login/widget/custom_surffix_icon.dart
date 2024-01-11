import 'package:flutter/material.dart';

import '../../../../utils/size_config.dart';
import '../../../../utils/style.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        15,
      ),
      child: Icon(
        icon,
        size: 18,
        color: kPrimaryColor,
      ),
    );
  }
}

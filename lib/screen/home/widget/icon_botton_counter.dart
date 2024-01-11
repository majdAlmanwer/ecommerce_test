import 'package:flutter/material.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:test_ecommerce/utils/style.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key,
    required this.widget,
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  final Widget widget;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(getPercentScreenWidth(2)),
            height: getPercentScreenWidth(12),
            width: getPercentScreenHeight(8),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: widget,
          ),
          if (numOfitem != 0)
            Positioned(
              top: -10,
              right: 0,
              child: Container(
                height: getPercentScreenHeight(6),
                width: getPercentScreenWidth(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfitem",
                    style: TextStyle(
                      fontSize: getPercentScreenWidth(3),
                      // height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

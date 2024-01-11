// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_ecommerce/utils/enums.dart';
import 'package:test_ecommerce/utils/style.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 25,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.home_outlined,
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  iconSize: 30,
                  onPressed: () {}
                  // Navigator.pushNamed(context, HomeScreen.routeName),
                  ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                iconSize: 30,
              ),
              IconButton(
                icon: Icon(Icons.chat),
                onPressed: () {},
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                iconSize: 30,
              ),
              IconButton(
                  icon: Icon(
                    Icons.person,
                    color: MenuState.profile == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  iconSize: 30,
                  onPressed: () {}
                  // Navigator.pushNamed(context, ProfileScreen.routeName),
                  ),
            ],
          )),
    );
  }
}

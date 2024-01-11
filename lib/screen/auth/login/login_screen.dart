// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_ecommerce/screen/auth/login/widget/login_body.dart';

import '../../../utils/style.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Sign In",
          style: TextStyle(fontFamily: 'Muli', color: kTextColor),
        ),
      ),
      body: LoginBody(),
    );
  }
}

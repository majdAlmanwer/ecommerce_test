// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'custom_text_form.dart';
import 'no_account_text.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
      child: SizedBox(
        width: getPercentScreenWidth(100),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getPercentScreenWidth(2)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getPercentScreenHeight(4)),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Muli'),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Muli'),
                ),
                SizedBox(height: getPercentScreenHeight(5)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SignForm(),
                ),
                SizedBox(height: getPercentScreenHeight(2)),
                SizedBox(height: getPercentScreenHeight(5)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

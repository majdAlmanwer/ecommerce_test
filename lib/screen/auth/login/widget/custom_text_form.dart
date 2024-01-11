// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_ecommerce/controller/auth_controller.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/style.dart';
import '../../../../widgets/df_button.dart';
import 'custom_surffix_icon.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final authController = Get.put(AuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getPercentScreenHeight(6)),
          buildPasswordFormField(),
          SizedBox(height: getPercentScreenHeight(6)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(
                "Remember me",
                style: TextStyle(fontFamily: 'Muli'),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                // => Navigator.pushNamed(
                //     context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      decoration: TextDecoration.underline, fontFamily: 'Muli'),
                ),
              )
            ],
          ),
          // FormError(errors: errors),
          SizedBox(
            height: getPercentScreenHeight(5),
            width: getPercentScreenWidth(60),
          ),
          SizedBox(
            height: getPercentScreenHeight(6),
            width: getPercentScreenWidth(60),
            child: DefaultButton(
              text: "Sign In",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print('done');
                  Get.showOverlay(
                      asyncFunction: () async {
                        await authController.login(
                            emailController.text, passwordController.text);
                      },
                      loadingWidget: Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      ));

                  // if all are valid then go to success screen
                  // KeyboardUtil.hideKeyboard(context);
                  // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
                print('not vaild');
              },
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: passwordController,
      obscureText: _showPassword,
      onSaved: (newValue) => passwordController.text == newValue,
      onChanged: (value) {
        if (value.isEmpty) {
          value = passwordController.text;
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          passwordController.text = value;
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return kPassNullError;
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: kTextColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: kTextColor),
        ),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          child: Padding(
            padding: EdgeInsets.all(
              15,
            ),
            child: Icon(
                _showPassword == true ? Icons.visibility_off : Icons.visibility,
                color: kPrimaryColor,
                size: 18),
          ),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailController,

      keyboardType: TextInputType.emailAddress,
      // onSaved: (newValue) => emailController.text == newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          value = emailController.text;
          removeError(error: kEmailNullError);
        }

        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return kEmailNullError;
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: kTextColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: kTextColor),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          icon: Icons.mail,
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ecommerce/utils/style.dart';

import '../../../../utils/size_config.dart';

class DropDownList extends StatefulWidget {
  DropDownList({super.key, required this.list, this.category});
  List list = [];
  String? category;

  // int? selectedId;
  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  RxString select = ''.obs;
  // RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Get.bottomSheet(
          backgroundColor: Colors.white,
          isDismissible: true,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: getPercentScreenHeight(40),
                child: ListView.builder(
                  itemCount: widget.list.toList(growable: true).length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              // splashRadius: 25,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              value: false,

                              onChanged: (value) {
                                setState(() {
                                  select.value = widget.list[index];
                                });

                                Get.back();
                              },
                              activeColor: Colors.blue,
                            ),
                            Text(
                              widget.list[index],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: 'Muli',
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.black45,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: getPercentScreenHeight(7),
        width: getPercentScreenWidth(90),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        child: select.value.isEmpty
            ? Text(
                widget.category != null ? widget.category! : 'Select Category',
                style: const TextStyle(
                  color: kTextColor,
                  fontSize: 15,
                  fontFamily: 'Muli',
                ),
              )
            : Text(
                select.value,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontFamily: 'Muli',
                ),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_ecommerce/utils/size_config.dart';
import 'package:test_ecommerce/utils/style.dart';
import 'package:get/get.dart';
import '../../../controller/product_controller.dart';
import '../../../routes/routes.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final SearchController controller = SearchController();
  String serach = '';
  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find();
    // final SearchController controller = SearchController();
    return Container(
      width: getPercentScreenWidth(60),
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: SearchAnchor(
        searchController: controller,
        builder: (BuildContext context, SearchController controller) {
          return TextField(
            onChanged: (value) {
              setState(() {
                serach = value;
              });
            },
            onSubmitted: (v) {
              setState(() {
                v = serach;
                controller.openView();
              });
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    horizontal: getPercentScreenWidth(10),
                    vertical: getPercentScreenHeight(2)),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
                prefixIcon: const Icon(Icons.search)),
          );
        },
        suggestionsBuilder:
            (BuildContext context, SearchController controller) {
          // productController.getFilteredList(controller.text);

          return List<ListTile>.generate(
              productController.allProductList
                  .where((element) => element.title!.contains(serach))
                  .toList()
                  .length, (int index) {
            final String item = productController.allProductList[index].title!;
            return ListTile(
              title: Text(item,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'segoeui')),
              trailing: SizedBox(
                height: getPercentScreenHeight(8),
                width: getPercentScreenWidth(8),
                child: Image.network(
                  "${productController.allProductList[index].image!}",
                  // proList[index].image!,

                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                Get.toNamed(AppRoutes.productdetails, arguments: {
                  'product': productController.allProductList[index]
                });
              },
            );
          });
        },
      ),
    );
  }
}

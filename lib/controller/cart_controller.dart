// ignore_for_file: depend_on_referenced_packages, unnecessary_type_check

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_ecommerce/model/cart_model.dart';

import '../widgets/custom_snack_bar.dart';

class CartController extends GetxController {
  GetStorage box = GetStorage();
  double grandTotal = 0.0;
  RxInt qyt = 1.obs;
  List<CartModel> cartItems = [];

  bool isItemAlreadyAdded(CartModel itemNew) {
    return cartItems
        .where((item) => item.productId == itemNew.productId)
        .isNotEmpty;
  }

  void addItemToCart(CartModel item) {
    if (isItemAlreadyAdded(item)) {
      Get.showSnackbar(CustomSnackBar(
        onTap: () {},
        message: 'Item Already Added To Cart',
      ));
      update();
    } else {
      cartItems.add(item);
      qyt.value = item.quantity;
      List items_cart = cartItems.map((CartModel e) => e.toJson()).toList();

      box.write('items_cart', items_cart);

      Get.showSnackbar(CustomSnackBar(
        onTap: () {},
        message: 'Item Add To Cart',
      ));
      update();
    }
  }

  // Removing selected item from the list of cart
  void removeSelectedItemFromCart(int index) {
    cartItems.removeAt(index);
    print(index);
    List<Map<String, dynamic>> items_cart =
        cartItems.map((CartModel e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
    update();
  }

  void increaseQtyOfSelectedItemInCart(int index, CartModel quantity) {
    cartItems[index].quantity++;
    update();
    List<Map<String, dynamic>> items_cart =
        cartItems.map((CartModel e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  // Decrease qty of the selected item
  void decreaseQtyOfSelectedItemInCart(int index, CartModel item) {
    if (item.quantity == 1) {
      cartItems.removeAt(index);
    } else {
      cartItems[index].quantity--;
    }
    print(index);
    update();
    List<Map<String, dynamic>> items_cart =
        cartItems.map((CartModel e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  // Calculate the grand total value
  void calculateGrandTotal() {
    grandTotal = 0;
    for (int i = 0; i < cartItems.length; i++) {
      // grandTotal =
      grandTotal =
          grandTotal += (cartItems[i].quantity.obs * cartItems[i].unitPrice!);

      update();
    }
    update();

    print('toaaaaataaaaaalaaaaaal${grandTotal}');
  }

  void updatingSession() {
    box.listenKey('items_cart', (updatedValue) {
      if (updatedValue is List) {
        cartItems.clear();
        cartItems
            .addAll(updatedValue.map((e) => CartModel.fromJson(e)).toList());
        calculateGrandTotal();
      }
    });
  }

  void getUpdatedSessionCartData() {
    if (box.hasData('items_cart')) {
      List<dynamic> value = GetStorage().read('items_cart');
      if (value is List) {
        cartItems.clear();
        cartItems.addAll(value.map((e) => CartModel.fromJson(e)));
        calculateGrandTotal();
      }
    }
  }

  void endOrder() {
    cartItems.clear();
    box.remove('items_cart');
    calculateGrandTotal();
  }

  @override
  void onReady() {
    updatingSession();
    getUpdatedSessionCartData();
    calculateGrandTotal();
    super.onReady();
  }
}

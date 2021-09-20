import 'package:dashboard_template/constants/style.dart';
import 'package:dashboard_template/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();

  var activeItem = overViewPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemname) {
    if (!isActive(itemname)) hoverItem.value = itemname;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHover(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overViewPageRoute:
        return _customIcon(Icons.trending_up, itemName);

      case driversPageRoute:
        return _customIcon(Icons.drive_eta, itemName);

      case clientViewPageRoute:
        return _customIcon(Icons.people_alt_outlined, itemName);

      case authenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);

      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 22,
        color: dark,
      );
    }

    return Icon(
      icon,
      color: isHover(itemName) ? dark : lightGray,
    );
  }
}

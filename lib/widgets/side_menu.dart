import 'package:dashboard_template/constants/controllers.dart';
import 'package:dashboard_template/constants/style.dart';
import 'package:dashboard_template/helpers/responsiveness.dart';
import 'package:dashboard_template/routing/routes.dart';
import 'package:dashboard_template/widgets/custom_text.dart';
import 'package:dashboard_template/widgets/side_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsivenessWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: _width / 48,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset('assets/icon/logo.png'),
                    ),
                    Flexible(
                        child: CustomText(
                            text: "Dash",
                            size: 20,
                            weight: FontWeight.bold,
                            color: active)),
                    SizedBox(
                      width: _width / 48,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Divider(
                  color: lightGray.withOpacity(0.1),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: sideMenuItems
                      .map((itemName) => SideMenuItem(
                          itemName: itemName == authenticationPageRoute
                              ? "Log out"
                              : itemName,
                          onTap: () {
                            if (itemName == authenticationPageRoute) {
                              // TODO :: go to authentction page
                            }

                            if (!menuController.isActive(itemName)) {
                              menuController.changeActiveItemTo(itemName);
                              if (ResponsivenessWidget.isSmallScreen(context)) {
                                Get.back();
                              }
                              //TODO :: go to route
                            }
                          }))
                      .toList(),
                )
              ],
            )
        ],
      ),
    );
  }
}

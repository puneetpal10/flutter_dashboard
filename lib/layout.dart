import 'package:dashboard_template/helpers/responsiveness.dart';
import 'package:dashboard_template/widgets/large_screen.dart';
import 'package:dashboard_template/widgets/small_screen.dart';
import 'package:dashboard_template/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  SiteLayout({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoledKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoledKey,
        appBar: topNavigationBar(context, scaffoledKey),
        drawer: const Drawer(),
        body: const ResponsivenessWidget(
            largeeScreen: LargeScreen(), smallScreen: SmallScreen()));
  }
}

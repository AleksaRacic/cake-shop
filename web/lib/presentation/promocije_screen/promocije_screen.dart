import 'package:slatkizalogaj/services/torta_service.dart';
import 'package:slatkizalogaj/widgets/bottom_navigation_bar.dart';
import 'package:slatkizalogaj/widgets/drawer/drawer.dart';

import '../promocije_screen/widgets/promocijacard_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PromocijeScreen extends StatelessWidget {
  const PromocijeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(),
            endDrawer: CustomDrawer(),
            body: Container(
                width: double.maxFinite,
                margin: EdgeInsets.fromLTRB(50, 100, 50, 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0x22F68472),
                ),
                child: CarouselSlider(
                    options:
                        CarouselOptions(autoPlay: true, viewportFraction: 0.4),
                    items: _buildPromocijaCard(context)))));
  }

  /// Section Widget
  List<Widget> _buildPromocijaCard(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < TortaService.getRandomSize(); i++) {
      final torta = TortaService.getRandomTorta(i);
      list.add(GestureDetector(
        onTap: () {
          print('Torta at $i was tapped.');
          TortaService.setSelectedTorta(torta);
          Navigator.pushNamed(context, AppRoutes.detaljiScreen);
        },
        child: PromocijacardItemWidget(torta: torta),
      ));
    }
    return list;
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:slatkizalogaj/model/torta.dart';
import 'package:slatkizalogaj/presentation/promocije_screen/widgets/promocijacard_item_widget.dart';
import 'package:slatkizalogaj/services/torta_service.dart';

import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';
import 'package:slatkizalogaj/widgets/drawer/drawer.dart';

class TorteScreen extends StatefulWidget {
  const TorteScreen({Key? key}) : super(key: key);

  @override
  _TorteScreen createState() => _TorteScreen();
}

class _TorteScreen extends State<TorteScreen> {
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
  }

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
                margin: EdgeInsets.fromLTRB(50, 100, 50, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0x22F68472),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      CarouselSlider(
                        items: TortaService.torte.map((torta) {
                          return _buildUserProfile(context, torta);
                        }).toList(),
                        options: CarouselOptions(
                            enlargeCenterPage: true, height: 700),
                        carouselController: _controller,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () => _controller.previousPage(),
                              child: Text('<',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            ),
                          ),
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () => _controller.nextPage(),
                              child: Text('>',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black)),
                            ),
                          ),
                          ...Iterable<int>.generate(TortaService.torte.length)
                              .map((int pageIndex) => Flexible(
                                    child: ElevatedButton(
                                      onPressed: () =>
                                          _controller.animateToPage(pageIndex),
                                      child: Text(
                                        "$pageIndex",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                    ),
                                  )),
                        ],
                      )
                    ],
                  ),
                ))));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context, Torta torta) {
    return GestureDetector(
      onTap: () {
        TortaService.setSelectedTorta(torta);
        Navigator.pushNamed(context, AppRoutes.detaljiScreen);
      },
      child: PromocijacardItemWidget(torta: torta),
    );
  }
}

import 'package:slatkizalogaj/model/torta.dart';
import 'package:slatkizalogaj/services/torta_service.dart';
import 'package:slatkizalogaj/widgets/bottom_navigation_bar.dart';

import '../promocije_screen/widgets/promocijacard_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';

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
            body: Container(
                width: SizeUtils.width,
                height: SizeUtils.height,
                child: Container(
                    width: double.maxFinite,
                    child: Column(children: [
                      Text("Promocije", style: theme.textTheme.displayMedium),
                      SizedBox(
                          height: 600.v,
                          width: double.maxFinite,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [_buildPromocijaCard(context)]))
                    ]))),
            bottomNavigationBar: BottomBar()));
  }

  /// Section Widget
  Widget _buildPromocijaCard(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 12.h, top: 0.v, right: 12.h),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 43.v);
                },
                itemCount: TortaService.getRandomSize(),
                itemBuilder: (context, index) {
                  final torta = TortaService.getRandomTorta(index);
                  return GestureDetector(
                    onTap: () {
                      print('Torta at $index was tapped.');
                      TortaService.setSelectedTorta(torta);
                      Navigator.pushNamed(context, AppRoutes.detaljiScreen);
                    },
                    child: PromocijacardItemWidget(torta: torta),
                  );
                })));
  }
}

import 'package:slatkizalogaj/presentation/torte_screen/widgets/userprofile1_item_widget.dart';
import 'package:slatkizalogaj/services/torta_service.dart';
import 'package:slatkizalogaj/widgets/bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';

import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';

class KolaIoneScreen extends StatelessWidget {
  const KolaIoneScreen({Key? key}) : super(key: key);

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
                      Text("Kolaci", style: theme.textTheme.displayMedium),
                      SizedBox(height: 51.v),
                      _buildUserProfile(context)
                    ]))),
            bottomNavigationBar: BottomBar()));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return SizedBox(
        height: 455.v,
        child: ListView.separated(
            padding: EdgeInsets.only(left: 17.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 140.h);
            },
            itemCount: TortaService.getKolaciCount(),
            itemBuilder: (context, index) {
              final torta = TortaService.getKolac(index);
              return GestureDetector(
                onTap: () {
                  print('Torta at $index was tapped.');
                  TortaService.setSelectedTorta(torta);
                  Navigator.pushNamed(context, AppRoutes.detaljiScreen);
                },
                child: Userprofile1ItemWidget(torta: torta),
              );
            }));
  }
}

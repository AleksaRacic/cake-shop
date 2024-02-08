import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/services/korpa_service.dart';
import 'package:slatkizalogaj/services/torta_service.dart';
import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';
import 'package:slatkizalogaj/widgets/bottom_navigation_bar.dart';
import 'package:slatkizalogaj/widgets/custom_elevated_button.dart';
import 'package:slatkizalogaj/widgets/custom_outlined_button.dart';
import 'package:slatkizalogaj/widgets/drawer/drawer.dart';

class DetaljiScreen extends StatefulWidget {
  @override
  _CakeDetailPageState createState() => _CakeDetailPageState();
}

class _CakeDetailPageState extends State<DetaljiScreen> {
  int quantity = 1;
  final torta = TortaService.selectedTorta;

  @override
  Widget build(BuildContext context) {
    final scale = 0.8;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      endDrawer: CustomDrawer(),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Transform.scale(
              scale: scale,
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    _buildSeven(context),
                    SizedBox(height: 30.v),
                    Padding(
                        padding: EdgeInsets.only(left: 32.h),
                        child: Text(torta.description,
                            style: CustomTextStyles
                                .titleLargeIBMPlexSansBlack900)),
                    SizedBox(height: 36.v),
                    Container(
                        width: 82.h,
                        margin: EdgeInsets.only(left: 41.h),
                        child: Text(
                            "Sastojci \n" +
                                torta.sastojci.replaceAll(", ", "\n"),
                            maxLines: 7,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles
                                .titleLargeIBMPlexSansBlack900)),
                    SizedBox(height: 36.v),
                    CustomElevatedButton(
                        height: 42.v,
                        width: 173.h,
                        text: "Komentari",
                        margin: EdgeInsets.only(left: 260.h),
                        buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                        buttonTextStyle:
                            CustomTextStyles.labelLargeManropeWhiteA700,
                        onPressed: () {
                          onTapKomentari(context);
                        }),
                    SizedBox(height: 39.v),
                    _buildFrame(context),
                    SizedBox(height: 18.v),
                    CustomElevatedButton(
                        onPressed: () {
                          ShoppingCartService.add(torta, quantity);
                          setState(() {
                            quantity = 1;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Dodano u korpu'),
                            backgroundColor: Color(0xFFF187B3),
                          ));
                        },
                        height: 42.v,
                        width: 173.h,
                        text: "Dodaj u korpu",
                        margin: EdgeInsets.only(left: 260.h),
                        buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                        buttonTextStyle:
                            CustomTextStyles.labelLargeManropeWhiteA700),
                    SizedBox(height: 5.v)
                  ])))),
    ));
  }

  /// Section Widget
  Widget _buildSeven(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SizedBox(
            height: 156.v,
            width: double.maxFinite,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              CustomImageView(
                  imagePath: torta.image_path,
                  height: 155.v,
                  width: double.maxFinite.h,
                  radius: BorderRadius.circular(17.h),
                  alignment: Alignment.center),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      margin: EdgeInsets.only(top: 74.v),
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.h, vertical: 7.v),
                      decoration: AppDecoration.fillErrorContainer.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder17),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 3.h, top: 13.v),
                                child: Text(torta.name,
                                    style: theme.textTheme.displaySmall)),
                            Padding(
                                padding:
                                    EdgeInsets.only(top: 17.v, bottom: 3.v),
                                child: Text(torta.rating,
                                    style: theme.textTheme.headlineLarge))
                          ])))
            ])));
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 21.v),
        decoration: AppDecoration.outlineBlueGrayE
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder14),
        child: Row(children: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              setState(() {
                if (quantity > 1) quantity--;
              });
            },
          ),
          CustomOutlinedButton(
              width: 38.h,
              text: '$quantity',
              margin: EdgeInsets.only(left: 1.h, top: 1.v)),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
          ),
          Spacer(),
          Padding(
              padding: EdgeInsets.only(top: 8.v, bottom: 2.v),
              child: Text("RSD " + (torta.price * quantity).toString(),
                  style: CustomTextStyles.titleLargeGray80001))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 22.h, right: 11.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10.h))),
        child: CustomImageView(
            imagePath: ImageConstant.imgIcons,
            height: 35.v,
            width: 315.h,
            margin: EdgeInsets.fromLTRB(20.h, 10.v, 24.h, 19.v)));
  }

  /// Navigates to the notifikacijeScreen when the action is triggered.
  onTapBell(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notifikacijeScreen);
  }

  /// Navigates to the korpaScreen when the action is triggered.
  onTapHelp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.korpaScreen);
  }

  /// Navigates to the komentariScreen when the action is triggered.
  onTapKomentari(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.komentariScreen);
  }
}

import 'package:slatkizalogaj/services/korpa_service.dart';
import 'package:slatkizalogaj/widgets/bottom_navigation_bar.dart';
import 'package:slatkizalogaj/widgets/drawer/drawer.dart';

import '../korpa_screen/widgets/productlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';

class KorpaScreen extends StatelessWidget {
  const KorpaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            appBar: CustomAppBar(),
            endDrawer: CustomDrawer(),
            body: Container(
                child: Row(children: [
              SingleChildScrollView(
                  child: Container(
                      width: SizeUtils.width,
                      height: SizeUtils.height,
                      child: Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(horizontal: 16.h),
                          child: Column(children: [
                            SizedBox(height: 50.v),
                            Text("Korpa", style: theme.textTheme.displayMedium),
                            ShoppingCartService.getCartSize() > 0
                                ? _buildProductList(context)
                                : SizedBox(
                                    height: 200.v,
                                    child: Center(
                                        child: Text("Korpa je prazna",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black)))),
                          ])))),
              Container(
                  width: 500,
                  height: 700,
                  margin: EdgeInsets.fromLTRB(50, 100, 50, 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0x44644430),
                  ),
                  child: ShoppingCartService.getCartSize() > 0
                      ? Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                height: 70,
                                child: _buildThirtyNine(context,
                                    ShoppingCartService.calculateTotal()),
                              )))
                      : Container())
            ]))));
  }

  /// Section Widget
  Widget _buildProductList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8.h, right: 2.h),
        child: Column(children: [
          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 34.v);
              },
              itemCount: ShoppingCartService.getCartSize(),
              itemBuilder: (context, index) {
                return ProductlistItemWidget(
                  torta: ShoppingCartService.getCartItem(index),
                  quantity: ShoppingCartService.getCartItemAmount(index),
                );
              }),
        ]));
  }

  /// Section Widget
  Widget _buildThirtyNine(BuildContext context, double total) {
    return Container(
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder14),
        child: Row(children: [
          Padding(
              padding: EdgeInsets.only(left: 12.h),
              child: Text(total.toString() + " RSD",
                  style: CustomTextStyles.titleLargeGray5001)),
          Spacer(),
          Text("  Naruči", style: CustomTextStyles.titleLargeGray5001),
          CustomImageView(
              onTap: () {
                ShoppingCartService.addOrder();
                Navigator.of(context).pushNamed(AppRoutes.korpaScreen);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Uspesno naruceno'),
                  backgroundColor: Color(0xFFF187B3),
                ));
              },
              imagePath: ImageConstant.imgRight,
              height: 30.adaptSize,
              width: 30.adaptSize,
              margin: EdgeInsets.only(left: 11.h))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: appTheme.whiteA700,
            borderRadius: BorderRadius.vertical(top: Radius.circular(17.h))));
  }

  /// Navigates to the notifikacijeScreen when the action is triggered.
  onTapBell(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notifikacijeScreen);
  }
}

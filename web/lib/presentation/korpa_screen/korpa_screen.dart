import 'package:slatkizalogaj/services/korpa_service.dart';
import 'package:slatkizalogaj/widgets/bottom_navigation_bar.dart';

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
            body: SingleChildScrollView(
                child: Container(
                    width: SizeUtils.width,
                    height: SizeUtils.height,
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(horizontal: 16.h),
                        child: Column(children: [
                          SizedBox(height: 3.v),
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
            bottomNavigationBar: BottomBar()));
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
          _buildThirtyNine(context, ShoppingCartService.calculateTotal()),
        ]));
  }

  /// Section Widget
  Widget _buildThirtyNine(BuildContext context, double total) {
    return Container(
        margin: EdgeInsets.only(left: 8.h, right: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 14.v),
        decoration: AppDecoration.fillPrimary
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder14),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 12.h),
                  child: Text(total.toString() + " RSD",
                      style: CustomTextStyles.titleLargeGray5001)),
              Spacer(),
              Text("  Naruči", style: CustomTextStyles.titleLargeGray5001),
              CustomImageView(
                  onTap: () {
                    ShoppingCartService.resetCart();
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

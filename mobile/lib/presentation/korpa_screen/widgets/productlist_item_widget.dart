import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/model/torta.dart';
import 'package:slatkizalogaj/presentation/korpa_screen/korpa_screen.dart';
import 'package:slatkizalogaj/services/korpa_service.dart';
import 'package:slatkizalogaj/widgets/custom_outlined_button.dart';

class ProductlistItemWidget extends StatefulWidget {
  final Torta torta;
  final int quantity;

  const ProductlistItemWidget(
      {Key? key, required this.torta, required this.quantity})
      : super(key: key);
  @override
  _CakeDetailPageState createState() => _CakeDetailPageState();
}

// ignore: must_be_immutable
class _CakeDetailPageState extends State<ProductlistItemWidget> {
  late int quantity;
  late final torta = widget.torta;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 10.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder17,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 19.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: torta.image_path,
                  height: 99.v,
                  width: 96.h,
                  radius: BorderRadius.circular(
                    8.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 21.h,
                    top: 26.v,
                    bottom: 35.v,
                  ),
                  child: Text(
                    torta.name,
                    style: CustomTextStyles.headlineSmallGray900,
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgTrashCan,
                  onTap: () {
                    ShoppingCartService.remove(torta);
                    Navigator.of(context).pushNamed(AppRoutes.korpaScreen);
                  },
                  height: 30.adaptSize,
                  width: 30.adaptSize,
                  margin: EdgeInsets.only(
                    top: 26.v,
                    bottom: 42.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 23.v),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                left: 29.h,
                right: 12.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 126.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgMinusSquarePink800,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          margin: EdgeInsets.symmetric(vertical: 8.v),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgPlusSquarePink800,
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          margin: EdgeInsets.symmetric(vertical: 8.v),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 4.v,
                      bottom: 5.v,
                    ),
                    child: Text(
                      quantity.toString() +
                          " x " +
                          torta.price.toString() +
                          " RSD",
                      style: CustomTextStyles.titleLargeGray80001,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 7.v),
        ],
      ),
    );
  }
}

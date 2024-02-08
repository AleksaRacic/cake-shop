import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/model/torta.dart';

// ignore: must_be_immutable
class PromocijacardItemWidget extends StatelessWidget {
  const PromocijacardItemWidget({Key? key, required this.torta})
      : super(
          key: key,
        );

  final Torta torta;

  @override
  Widget build(BuildContext context) {
    double scale = 0.8;
    return Transform.scale(
        scale: scale,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            color: appTheme.whiteA700,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusStyle.roundedBorder17,
            ),
            child: Container(
              height: 645.v * scale,
              width: 359.h * scale,
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder17,
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 455.v * scale,
                      width: 357.h * scale,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                              height: 300.v * scale,
                              width: 357.h * scale,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  CustomImageView(
                                    imagePath: torta.image_path,
                                    height: 455.v * scale,
                                    width: 356.h * scale,
                                    radius: BorderRadius.circular(
                                      17.h * scale,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 22.h * scale,
                                        vertical: 4.v * scale,
                                      ),
                                      decoration: AppDecoration
                                          .fillErrorContainer
                                          .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder17,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 20.v * scale),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.h * scale),
                                            child: Text(
                                              torta.name,
                                              style:
                                                  theme.textTheme.headlineSmall,
                                            ),
                                          ),
                                          SizedBox(height: 7.v * scale),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomImageView(
                                                imagePath:
                                                    ImageConstant.imgStar118x23,
                                                height: 18.v * scale,
                                                width: 23.h * scale,
                                                radius: BorderRadius.circular(
                                                  9.h * scale,
                                                ),
                                                margin: EdgeInsets.only(
                                                  top: 2.v * scale,
                                                  bottom: 8.v * scale,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 4.h * scale),
                                                child: Text(
                                                  torta.rating,
                                                  style: theme
                                                      .textTheme.titleLarge,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 13.h * scale,
                        right: 13.h * scale,
                        bottom: 76.v * scale,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 1.v),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cena",
                                        style: theme.textTheme.labelLarge,
                                      ),
                                      Text(
                                        "RSD",
                                        style: CustomTextStyles
                                            .headlineSmallPrimary,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8.h * scale,
                                    top: 25.v * scale,
                                  ),
                                  child: Text(
                                    torta.price.toString(),
                                    style:
                                        CustomTextStyles.headlineSmallRegular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 35.v * scale),
                          Text(
                            "Opis",
                            style: CustomTextStyles.titleLargeGray90001,
                          ),
                          SizedBox(height: 44.v * scale),
                          Container(
                            width: 311.h,
                            margin: EdgeInsets.only(right: 100.h * scale),
                            child: Text(
                              torta.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

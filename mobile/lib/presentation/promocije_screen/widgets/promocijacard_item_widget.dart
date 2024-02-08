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
    return Align(
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
          height: 645.v,
          width: 359.h,
          decoration: AppDecoration.fillWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder17,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 455.v,
                  width: 357.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CustomImageView(
                        imagePath: torta.image_path,
                        height: 455.v,
                        width: 356.h,
                        radius: BorderRadius.circular(
                          26.h,
                        ),
                        alignment: Alignment.center,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 22.h,
                            vertical: 11.v,
                          ),
                          decoration: AppDecoration.fillErrorContainer.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder26,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 8.v),
                              Text(
                                torta.name,
                                style: theme.textTheme.headlineSmall,
                              ),
                              Text(
                                torta.description,
                                style: theme.textTheme.bodyLarge,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgStar1,
                                    height: 22.v,
                                    width: 23.h,
                                    radius: BorderRadius.circular(
                                      1.h,
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 2.v,
                                      bottom: 4.v,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.h),
                                    child: Text(
                                      torta.rating,
                                      style: theme.textTheme.titleLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 455.v,
                          width: 357.h,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              CustomImageView(
                                imagePath: torta.image_path,
                                height: 455.v,
                                width: 356.h,
                                radius: BorderRadius.circular(
                                  17.h,
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 22.h,
                                    vertical: 4.v,
                                  ),
                                  decoration:
                                      AppDecoration.fillErrorContainer.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder17,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20.v),
                                      Padding(
                                        padding: EdgeInsets.only(left: 5.h),
                                        child: Text(
                                          torta.name,
                                          style: theme.textTheme.headlineSmall,
                                        ),
                                      ),
                                      SizedBox(height: 7.v),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                            imagePath:
                                                ImageConstant.imgStar118x23,
                                            height: 18.v,
                                            width: 23.h,
                                            radius: BorderRadius.circular(
                                              9.h,
                                            ),
                                            margin: EdgeInsets.only(
                                              top: 2.v,
                                              bottom: 8.v,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 4.h),
                                            child: Text(
                                              torta.rating,
                                              style: theme.textTheme.titleLarge,
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
                    left: 13.h,
                    right: 13.h,
                    bottom: 76.v,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cena",
                                    style: theme.textTheme.labelLarge,
                                  ),
                                  Text(
                                    "RSD",
                                    style:
                                        CustomTextStyles.headlineSmallPrimary,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 8.h,
                                top: 13.v,
                              ),
                              child: Text(
                                torta.price.toString(),
                                style: CustomTextStyles.headlineSmallRegular,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 35.v),
                      Text(
                        "Opis",
                        style: CustomTextStyles.titleLargeGray90001,
                      ),
                      SizedBox(height: 44.v),
                      Container(
                        width: 311.h,
                        margin: EdgeInsets.only(right: 100.h),
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
    );
  }
}

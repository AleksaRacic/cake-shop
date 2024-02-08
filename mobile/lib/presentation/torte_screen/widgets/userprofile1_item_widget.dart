import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/model/torta.dart';

// ignore: must_be_immutable
class Userprofile1ItemWidget extends StatelessWidget {
  const Userprofile1ItemWidget({Key? key, required this.torta})
      : super(
          key: key,
        );

  final Torta torta;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 455.v,
      width: 357.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: this.torta.image_path,
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
              margin: EdgeInsets.only(top: 352.v),
              padding: EdgeInsets.all(24.h),
              decoration: AppDecoration.fillErrorContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder17,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 3.h,
                      top: 1.v,
                    ),
                    child: Text(
                      this.torta.name,
                      style: theme.textTheme.displaySmall,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgStar112,
                    height: 32.v,
                    width: 40.h,
                    radius: BorderRadius.circular(
                      16.h,
                    ),
                    margin: EdgeInsets.only(
                      top: 13.v,
                      bottom: 8.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.v),
                    child: Text(
                      this.torta.rating,
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

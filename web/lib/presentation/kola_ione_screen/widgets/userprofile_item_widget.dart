import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  const UserprofileItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 455.v,
      width: 357.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img38d5902ce335fe0455x356,
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
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 25.v,
              ),
              decoration: AppDecoration.fillErrorContainer.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder17,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.h),
                    child: Text(
                      "Kolač1",
                      style: theme.textTheme.displaySmall,
                    ),
                  ),
                  Spacer(),
                  CustomImageView(
                    imagePath: ImageConstant.imgStar132x40,
                    height: 32.v,
                    width: 40.h,
                    radius: BorderRadius.circular(
                      16.h,
                    ),
                    margin: EdgeInsets.only(
                      top: 12.v,
                      bottom: 7.v,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 7.v),
                    child: Text(
                      "4.5",
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

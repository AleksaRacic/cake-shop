import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/widgets/app_bar/appbar_leading_image.dart';
import 'package:slatkizalogaj/widgets/app_bar/appbar_trailing_image.dart';

// ignore: must_be_immutable
class CustomAppBarProfile extends StatelessWidget
    implements PreferredSizeWidget {
  CustomAppBarProfile({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 56.v,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: 36.h,
      leading: AppbarLeadingImage(
          imagePath: ImageConstant.imgBell,
          margin: EdgeInsets.only(left: 16.h, bottom: 3.v),
          onTap: () {
            onTapBell(context);
          }),
      titleSpacing: 0,
      centerTitle: true,
      actions: [
        AppbarTrailingImage(
            imagePath: ImageConstant.imgHelp,
            margin: EdgeInsets.only(left: 20.h, top: 1.v, right: 20.h),
            onTap: () {
              onTapHelp(context);
            })
      ],
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        56.v,
      );

  _getStyle() {
    return Container(
      height: 70.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.circular(
          17.h,
        ),
      ),
    );
  }

  onTapBell(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notifikacijeScreen);
  }

  /// Navigates to the korpaScreen when the action is triggered.
  onTapHelp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.korpaScreen);
  }
}

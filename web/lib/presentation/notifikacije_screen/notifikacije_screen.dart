import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';

import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';

class NotifikacijeScreen extends StatelessWidget {
  const NotifikacijeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: false,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.whiteA700,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgLogin,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Container(
                  decoration: AppDecoration.outlineIndigo,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildFrameSixty(context),
                      _buildNotification(
                        context,
                        title: "Poslastičarnica",
                        message: "je odbila vašu narudžbinu",
                      ),
                      _buildNotification(
                        context,
                        title: "Poslastičarnica",
                        message: "je odbila vašu narudžbinu",
                      ),
                      _buildNotification(
                        context,
                        title: "Poslastičarnica",
                        message: "je odbila vašu narudžbinu",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrameSixty(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(32.h, 14.v, 32.h, 13.v),
      decoration: AppDecoration.outlineIndigo50011,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 7.v),
          Text(
            "Obaveštenja",
            style: CustomTextStyles.headlineLargeLatoPrimaryContainer,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(17.h),
        ),
      ),
    );
  }

  /// Common widget
  Widget _buildNotification(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.fromLTRB(16.h, 14.v, 16.h, 13.v),
      decoration: AppDecoration.outlineIndigo50012,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: theme.colorScheme.primaryContainer, fontSize: 20),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 5.h,
              top: 2.v,
              bottom: 1.v,
            ),
            child: Text(message,
                style: TextStyle(
                    color: theme.colorScheme.primaryContainer, fontSize: 18)),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgNewNotesIndicator,
            height: 5.adaptSize,
            width: 5.adaptSize,
            margin: EdgeInsets.only(bottom: 16.v),
          ),
        ],
      ),
    );
  }
}

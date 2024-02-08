import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/widgets/app_bar/custom_app_bar.dart';
import 'package:slatkizalogaj/widgets/bottom_navigation_bar.dart';

class KontaktScreen extends StatelessWidget {
  const KontaktScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: Container(
          color: Colors.transparent,
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 11.v),
              Spacer(flex: 35),
              Padding(
                  padding: EdgeInsets.only(left: 71.h),
                  child: _buildFrame1(context,
                      calendarImage: ImageConstant.imgCall,
                      faksText: "TELEFON\n",
                      faksNumber: "03 5432 1234")),
              SizedBox(height: 48.v),
              Padding(
                padding: EdgeInsets.only(left: 71.h),
                child: _buildFrame1(context,
                    calendarImage: ImageConstant.imgCalendar,
                    faksText: "FAKS\n",
                    faksNumber: "03 5432 1234"),
              ),
              SizedBox(height: 48.v),
              Padding(
                  padding: EdgeInsets.only(left: 71.h),
                  child: _buildFrame1(context,
                      calendarImage: ImageConstant.imgCalendar,
                      faksText: "E-MAIL\n",
                      faksNumber: "ram@etf.rs")),
              Spacer(flex: 64),
            ]),
            Align(
              alignment: Alignment.centerRight,
              child: CustomImageView(
                imagePath: "assets/images/mapa.png",
                height: 279.v,
                width: 264.h,
              ),
            ),
          ])),
    ));
  }

  /// Common widget
  Widget _buildFrame1(
    BuildContext context, {
    required String calendarImage,
    required String faksText,
    required String faksNumber,
  }) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomImageView(
          imagePath: calendarImage,
          height: 28.adaptSize,
          width: 28.adaptSize,
          margin: EdgeInsets.only(top: 2.v, bottom: 9.v)),
      Container(
          width: 130.h,
          margin: EdgeInsets.only(left: 15.h),
          child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: faksText,
                    style: CustomTextStyles.labelLargeMontserratff000000),
                TextSpan(
                    text: faksNumber,
                    style: CustomTextStyles.titleLargeMontserratffdd5471)
              ]),
              textAlign: TextAlign.left))
    ]);
  }
}

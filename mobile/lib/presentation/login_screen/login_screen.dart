import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/widgets/custom_elevated_button.dart';
import 'package:slatkizalogaj/widgets/custom_text_form_field.dart';

import '../../services/user_service.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController editTextController = TextEditingController();

  TextEditingController mdiremoveredeyeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
                child: Container(
                    width: SizeUtils.width,
                    height: SizeUtils.height,
                    child: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.h, vertical: 39.v),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          SizedBox(height: 5.v),
                          SizedBox(
                              height: 713.v,
                              width: 345.h,
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 13.h,
                                                vertical: 47.v),
                                            decoration: AppDecoration
                                                .outlineBlack
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder14),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  SizedBox(height: 4.v),
                                                  Text("Uloguj se",
                                                      style: CustomTextStyles
                                                          .headlineSmallIBMPlexSansPink800),
                                                  SizedBox(height: 33.v),
                                                  Text("Korisničko ime",
                                                      style: CustomTextStyles
                                                          .titleMediumPink800),
                                                  SizedBox(height: 5.v),
                                                  CustomTextFormField(
                                                      controller:
                                                          editTextController,
                                                      borderDecoration:
                                                          TextFormFieldStyleHelper
                                                              .fillGray,
                                                      fillColor:
                                                          appTheme.gray50),
                                                  SizedBox(height: 12.v),
                                                  Text("Lozinka",
                                                      style: CustomTextStyles
                                                          .titleMediumPink800),
                                                  SizedBox(height: 5.v),
                                                  CustomTextFormField(
                                                      controller:
                                                          mdiremoveredeyeController,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      suffix: Container(
                                                          margin: EdgeInsets
                                                              .fromLTRB(
                                                                  30.h,
                                                                  12.v,
                                                                  12.h,
                                                                  12.v),
                                                          child: CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgMdiremoveredeye,
                                                              height:
                                                                  24.adaptSize,
                                                              width: 24
                                                                  .adaptSize)),
                                                      suffixConstraints:
                                                          BoxConstraints(
                                                              maxHeight: 48.v),
                                                      obscureText: true,
                                                      borderDecoration:
                                                          TextFormFieldStyleHelper
                                                              .fillGray,
                                                      fillColor:
                                                          appTheme.gray50),
                                                  SizedBox(height: 40.v),
                                                  CustomElevatedButton(
                                                      width: 151.h,
                                                      text: "Uloguj se",
                                                      margin: EdgeInsets.only(
                                                          right: 2.h),
                                                      onPressed: () {
                                                        onTapUlogujSe(context);
                                                      },
                                                      alignment:
                                                          Alignment.centerRight)
                                                ]))),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgSlatkiZalogaj1,
                                        height: 279.v,
                                        width: 264.h,
                                        alignment: Alignment.topCenter)
                                  ]))
                        ]))))));
  }

  void onTapUlogujSe(BuildContext context) {
    String username = editTextController.text; // Assuming this is the username
    String password =
        mdiremoveredeyeController.text; // Assuming this is the password

    bool loginSuccessful = UserService.login(username, password);

    if (loginSuccessful) {
      Navigator.pushNamed(context, AppRoutes.promocijeScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Neispravni kredencijali'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

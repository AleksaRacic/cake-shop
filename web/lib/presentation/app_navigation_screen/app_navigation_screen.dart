import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Login",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Promocije",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.promocijeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "PromocijeTwo",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.promocijetwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "PromocijeThree",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.promocijethreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "KOlačiOne",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.kolaIoneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Torte",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.torteScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "KolačiTwo",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.kolaItwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "TorteTwo",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.tortetwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "KolačiThree",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.kolaIthreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "TorteThree",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.tortethreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profil",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.profilScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Detalji",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.detaljiScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "komentari",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.komentariScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Kontakt",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.kontaktScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Korpa",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.korpaScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notifikacije",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notifikacijeScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}

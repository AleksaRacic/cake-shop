import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart'; // Make sure this import is correct for your project
import 'package:slatkizalogaj/widgets/custom_image_view.dart'; // Make sure this import is correct for your project

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.v,
      decoration: BoxDecoration(
        color: appTheme.whiteA700,
        borderRadius: BorderRadius.vertical(top: Radius.circular(17.h)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GestureDetector(
            onTap: () => onImageTapPromocije(context),
            child:
                Image.asset('assets/images/Bakery.png', width: 50, height: 50),
          ),
          GestureDetector(
            onTap: () => onImageTapTorte(context),
            child: Image.asset('assets/images/Cake.png', width: 50, height: 50),
          ),
          GestureDetector(
            onTap: () => onImageTapKolaci(context),
            child:
                Image.asset('assets/images/Brezel.png', width: 50, height: 50),
          ),
          GestureDetector(
            onTap: () => onImageTapKontakt(context),
            child:
                Image.asset('assets/images/phone.png', width: 50, height: 50),
          ),
          GestureDetector(
            onTap: () => onImageTapProfil(context),
            child: Image.asset('assets/images/User.png', width: 50, height: 50),
          ),
        ],
      ),
    );
  }

  onImageTapPromocije(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.promocijeScreen);
  }

  onImageTapTorte(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.torteScreen);
  }

  onImageTapKolaci(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.kolaIoneScreen);
  }

  onImageTapKontakt(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.kontaktScreen);
  }

  onImageTapProfil(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profilScreen);
  }
}

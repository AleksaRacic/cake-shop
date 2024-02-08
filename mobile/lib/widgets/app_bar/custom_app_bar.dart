import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/widgets/app_bar/appbar_leading_image.dart';
import 'package:slatkizalogaj/widgets/app_bar/appbar_trailing_image.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0, // No shadow
      toolbarHeight: 56.v, // Adjust the height as needed
      automaticallyImplyLeading: false, // No back button
      backgroundColor: Colors.transparent, // Transparent AppBar
      leadingWidth: 36.h, // Adjust the width as needed
      leading: IconButton(
        icon: Icon(Icons.notifications, color: Colors.black), // Bell icon
        onPressed: () {
          onTapBell(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart,
              color: Colors.black), // Shopping cart icon
          onPressed: () {
            onTapHelp(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.v);

  onTapBell(BuildContext context) {
    // Handle bell icon tap
    Navigator.pushNamed(context, AppRoutes.notifikacijeScreen);
  }

  onTapHelp(BuildContext context) {
    // Handle shopping cart icon tap
    Navigator.pushNamed(context, AppRoutes.korpaScreen);
  }
}

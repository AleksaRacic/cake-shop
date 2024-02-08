import 'package:flutter/material.dart';
import 'package:slatkizalogaj/core/app_export.dart';
import 'package:slatkizalogaj/model/user.dart';
import 'package:slatkizalogaj/presentation/dodaj_akciju_screen/dodaj_prozivod_screen.dart';
import 'package:slatkizalogaj/services/state_service.dart';
import 'package:slatkizalogaj/services/user_service.dart';

class CustomAppBarZaposleni extends StatelessWidget
    implements PreferredSizeWidget {
  CustomAppBarZaposleni({
    Key? key,
  }) : super(key: key);

  final UserService userService = UserService();
  final User user = UserService.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 66,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 0.5],
            colors: [
              Color(0x33FFFFFF), // Your gradient's start color
              Color(
                  0x33F68472), // Your gradient's middle color // This ensures the bottom 50 pixels are white
            ],
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                ImageConstant
                    .imgSlatkiZalogaj1, // Replace with your logo asset path
                height: 50.h,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.dodajProizvodScreen);
                },
                child: Text('Dodaj proizvod',
                    style: TextStyle(color: Color(0xFF644430))),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.dodajAkcijuScreen);
                },
                child: Text('Dodaj Akciju',
                    style: TextStyle(color: Color(0xFF644430))),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.odobriPorudzbinu);
                },
                child: Text('Odobri Porudzbinu',
                    style: TextStyle(color: Color(0xFF644430))),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications, color: Color(0xFF644430)),
              onPressed: () {
                StateService.setState('notification');
                Scaffold.of(context).openEndDrawer();
              },
            ),
            Padding(
              // Need on tap funciton
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                  child: GestureDetector(
                onTap: () {
                  StateService.setState('profile');
                  Scaffold.of(context).openEndDrawer();
                },
                child: Text(
                  '   ' + user.firstName + ' ' + user.lastName,
                  style: TextStyle(color: Color(0xFF644430), fontSize: 16),
                ),
              )),
            ),
            // Add more icons if needed
          ],
        ));
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

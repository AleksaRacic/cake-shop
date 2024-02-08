import 'package:flutter/material.dart';
import 'package:slatkizalogaj/presentation/notifikacije_screen/notifikacije_screen.dart';
import 'package:slatkizalogaj/presentation/profil_screen/profil_screen.dart';
import 'package:slatkizalogaj/services/state_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  Widget _napravi() {
    print(StateService.state);
    if (StateService.state == 'notification') {
      return NotifikacijeScreen();
    } else {
      return ProfilScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600, // Width of the side modal
        color: Colors.white,
        child: _napravi());
  }
}

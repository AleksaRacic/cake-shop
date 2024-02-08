import 'package:flutter/material.dart';
import 'package:slatkizalogaj/presentation/dodaj_akciju_screen/dodaj_prozivod_screen.dart';
import 'package:slatkizalogaj/presentation/dodaj_proizvod_screen/dodaj_prozivod_screen.dart';
import 'package:slatkizalogaj/presentation/login_screen/login_screen.dart';
import 'package:slatkizalogaj/presentation/odobri_porudzbinu/odobri_porudzbinu.dart';
import 'package:slatkizalogaj/presentation/promocije_screen/promocije_screen.dart';
import 'package:slatkizalogaj/presentation/kola_ione_screen/kola_ione_screen.dart';
import 'package:slatkizalogaj/presentation/torte_screen/torte_screen.dart';
import 'package:slatkizalogaj/presentation/profil_screen/profil_screen.dart';
import 'package:slatkizalogaj/presentation/detalji_screen/detalji_screen.dart';
import 'package:slatkizalogaj/presentation/komentari_screen/komentari_screen.dart';
import 'package:slatkizalogaj/presentation/kontakt_screen/kontakt_screen.dart';
import 'package:slatkizalogaj/presentation/korpa_screen/korpa_screen.dart';
import 'package:slatkizalogaj/presentation/notifikacije_screen/notifikacije_screen.dart';
import 'package:slatkizalogaj/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String promocijeScreen = '/promocije_screen';

  static const String promocijetwoScreen = '/promocijetwo_screen';

  static const String promocijethreeScreen = '/promocijethree_screen';

  static const String kolaIoneScreen = '/kola_ione_screen';

  static const String torteScreen = '/torte_screen';

  static const String kolaItwoScreen = '/kola_itwo_screen';

  static const String tortetwoScreen = '/tortetwo_screen';

  static const String kolaIthreeScreen = '/kola_ithree_screen';

  static const String tortethreeScreen = '/tortethree_screen';

  static const String profilScreen = '/profil_screen';

  static const String detaljiScreen = '/detalji_screen';

  static const String komentariScreen = '/komentari_screen';

  static const String kontaktScreen = '/kontakt_screen';

  static const String korpaScreen = '/korpa_screen';

  static const String notifikacijeScreen = '/notifikacije_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String dodajProizvodScreen = '/dodaj_proizvod_screen';

  static const String dodajAkcijuScreen = '/dodaj_akciju_screen';

  static const String odobriPorudzbinu = '/odobri_porudzbinu';

  static Map<String, WidgetBuilder> routes = {
    loginScreen: (context) => LoginScreen(),
    promocijeScreen: (context) => PromocijeScreen(),
    kolaIoneScreen: (context) => KolaIoneScreen(),
    torteScreen: (context) => TorteScreen(),
    profilScreen: (context) => ProfilScreen(),
    detaljiScreen: (context) => DetaljiScreen(),
    komentariScreen: (context) => KomentariScreen(),
    kontaktScreen: (context) => KontaktScreen(),
    korpaScreen: (context) => KorpaScreen(),
    notifikacijeScreen: (context) => NotifikacijeScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    dodajProizvodScreen: (context) => DodajProizvodScreen(),
    dodajAkcijuScreen: (context) => DodajAkcijuScreen(),
    odobriPorudzbinu: (context) => OdobriPorudzbinu(),
  };
}

import 'dart:math';

import 'package:slatkizalogaj/model/torta.dart';

class TortaService {
  static final List<Torta> torte = [
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_3.png",
        name: "Cokoladna",
        rating: "3.5",
        description: "Cokoladna torta",
        tip: "TORTA",
        sastojci: "Cokolad, brasno, secer, jaja",
        price: 100),
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_4.png",
        name: "Vocna torta",
        rating: "4.5",
        description: "Vocna torta ima i banana",
        tip: "TORTA",
        sastojci: "Voca, brasno, secer, jaja",
        price: 200.44),
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_455x356.png",
        name: "Jagoda",
        rating: "4.6",
        description: "Torta od jagoda sa punoo voca",
        tip: "TORTA",
        sastojci: "Jagoda, brasno, secer, jaja",
        price: 300.44),
    Torta(
        image_path: "assets/images/img_rectangle_19.png",
        name: "Krem torta",
        rating: "4.7",
        description: "Krem torta jako je slatka",
        sastojci: "Krema, brasno, secer, jaja",
        tip: "TORTA",
        price: 400.44),
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_4.png",
        name: "Tortica",
        sastojci: "Krema, brasno, secer, jaja",
        rating: "4.8",
        description: "Tortica mala slatka",
        tip: "TORTA",
        price: 500.44),
  ];

  static final List<Torta> kolaci = [
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_4.png",
        name: "Kolacic",
        rating: "4.8",
        sastojci: "Krema, brasno, secer, jaja",
        description: "Tortica mala slatka",
        tip: "KOLAC",
        price: 500.44),
  ];

  static final List<Torta> random = getRandomList();

  static Torta getTorta(int index) {
    return torte[index];
  }

  static int getTorteCount() {
    return torte.length;
  }

  static Torta getKolac(int index) {
    return kolaci[index];
  }

  static int getKolaciCount() {
    return kolaci.length;
  }

  static int getRandomSize() {
    return 4;
  }

  static List<Torta> getRandomList() {
    var random = new Random();
    List<Torta> randomTorte = [];
    for (int i = 0; i < 2; i++) {
      randomTorte.add(torte[random.nextInt(torte.length)]);
    }
    for (int i = 0; i < 2; i++) {
      randomTorte.add(kolaci[random.nextInt(kolaci.length)]);
    }
    randomTorte.shuffle();
    return randomTorte;
  }

  static Torta getRandomTorta(int index) {
    return random[index];
  }

  static Torta _selectedTorta = torte[0];

  static Torta get selectedTorta => _selectedTorta;
  static void setSelectedTorta(Torta torta) {
    _selectedTorta = torta;
  }
}

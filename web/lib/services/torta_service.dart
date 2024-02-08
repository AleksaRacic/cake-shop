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
        promocija: true,
        price: 100),
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_4.png",
        name: "Vocna torta",
        rating: "4.5",
        description: "Vocna torta",
        tip: "TORTA",
        sastojci: "Voca, brasno, secer, jaja",
        price: 200.44),
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_455x356.png",
        name: "Jagoda",
        rating: "4.6",
        description: "Torta od jagoda",
        tip: "TORTA",
        sastojci: "Jagoda, brasno, secer, jaja",
        price: 300.44),
    Torta(
        image_path: "assets/images/img_rectangle_19.png",
        name: "Krem torta",
        rating: "4.7",
        description: "Torta je slatka",
        sastojci: "Krema, brasno, secer, jaja",
        tip: "TORTA",
        promocija: true,
        price: 400.44),
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_4.png",
        name: "Tortica",
        sastojci: "Krema, brasno, secer, jaja",
        rating: "4.8",
        description: "Tortica mala",
        tip: "TORTA",
        price: 500.44),
  ];

  static addTorta(Torta torta) {
    torte.add(torta);
  }

  static addKolac(Torta kolac) {
    kolaci.add(kolac);
  }

  static final List<Torta> kolaci = [
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_1.png",
        name: "Kolacic",
        rating: "4.8",
        sastojci: "Krema, brasno, secer, jaja",
        description: "Za slave",
        promocija: true,
        tip: "KOLAC",
        price: 500.44),
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_2.png",
        name: "Kolac2",
        rating: "4.8",
        sastojci: "Krema, brasno, secer, jaja",
        description: "Za svadbe",
        tip: "KOLAC",
        promocija: true,
        price: 500.44),
    Torta(
        image_path: "assets/images/img_38d5902ce335fe0_3.png",
        name: "Kolac3",
        rating: "4.8",
        sastojci: "Krema, brasno, secer, jaja",
        description: "Nemam inspiraciju",
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
    List<Torta> randomTorte = [];
    torte.forEach((element) {
      if (element.promocija) {
        randomTorte.add(element);
      }
    });
    kolaci.forEach((element) {
      if (element.promocija) {
        randomTorte.add(element);
      }
    });
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

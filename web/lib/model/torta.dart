class Torta {
  String image_path;
  String name;
  String rating;
  String description;
  String tip;
  double price;
  String sastojci;
  bool promocija = false;

  Torta(
      {required this.image_path,
      required this.name,
      required this.rating,
      required this.description,
      required this.tip,
      required this.price,
      required this.sastojci,
      this.promocija = false});

  setPromocija(bool value) {
    promocija = value;
  }

  setPrice(double value) {
    price = value;
  }
}

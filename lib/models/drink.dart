// ignore_for_file: public_member_api_docs, sort_constructors_first
class Drink {
  String name;
  String price;
  String imagePath;
  String rating;

  Drink({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.rating,
  });

  String get _name => name;
  String get _price => price;
  String get _imagPath => imagePath;
  String get _rating => rating;
}

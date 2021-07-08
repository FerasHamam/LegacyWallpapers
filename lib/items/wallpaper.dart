import 'company.dart';

class Wallpaper {
  final Company company;
  final String name;
  final String id;
  final String imageUrl;
  bool isFav;
  Wallpaper(
      {required this.company,
      required this.name,
      required this.id,
      required this.imageUrl,
      this.isFav = false});
}

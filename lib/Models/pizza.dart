import 'package:uuid/uuid.dart';
import 'package:pizza/category.dart';


class Pizza{

  String? id; 
  String? name; 
  double? price;
  List<String>? ingredients;
  Categorie? category;
  bool isLiked;


  Pizza({
    this.name = "Default",
    this.price = 0,
    this.ingredients = const [],
    this.category = Categorie.rossa,
    this.isLiked = false,
  }): id = const Uuid().v4();

}

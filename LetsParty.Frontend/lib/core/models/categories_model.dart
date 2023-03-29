import 'package:lets_party_frontend/core/models/item_model.dart';

class CategoriesModel {
  CategoriesModel(this.categoryName, this.items);
  String categoryName;
  List<ItemModel> items = [];
}
import 'package:flutter/cupertino.dart';
import 'package:lets_party_frontend/core/models/categories_model.dart';
import 'package:lets_party_frontend/core/models/item_model.dart';

class ItemsPageBloc extends ChangeNotifier {

  ItemsPageBloc() {
    listOfCategories = [
      CategoriesModel('Drinks', [
        ItemModel(
          'https://example.com/drink1.jpg',
          'Soda',
          2.99,
        ),
        ItemModel(
          'https://example.com/drink2.jpg',
          'Juice',
          3.99,
        ),
        ItemModel(
          'https://example.com/drink3.jpg',
          'Beer',
          5.99,
        ),
      ]),
      CategoriesModel('Snacks', [
        ItemModel(
          'https://example.com/snack1.jpg',
          'Chips',
          1.99,
        ),
        ItemModel(
          'https://example.com/snack2.jpg',
          'Popcorn',
          2.99,
        ),
        ItemModel(
          'https://example.com/snack3.jpg',
          'Nuts',
          3.99,
        ),

      ]),
      CategoriesModel('Party Supplies', [
        ItemModel(
          'https://example.com/tissue1.jpg',
          'Tissues',
          0.99,
        ),
        ItemModel(
          'https://example.com/cutlery1.jpg',
          'Plastic Cutlery',
          1.99,
        ),
        ItemModel(
          'https://example.com/napkins1.jpg',
          'Napkins',
          0.99,
        ),
      ]),
    ];

    loadingDone = true;
    notifyListeners();
  }
  bool loadingDone = false;
  List<CategoriesModel> listOfCategories = [];
}

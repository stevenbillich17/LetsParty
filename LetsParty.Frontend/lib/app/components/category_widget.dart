import 'package:flutter/material.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/core/models/categories_model.dart';
import 'package:lets_party_frontend/core/models/item_model.dart';
import 'package:lets_party_frontend/app/components/item_widget.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key,
    required this.category,
    required this.enableItemSelect,
  });

  final CategoriesModel category;
  bool enableItemSelect = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.categoryName,
          style: AppStyles.categoryStyle,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.items.length,
            itemBuilder: (BuildContext context, int index) {
              final ItemModel item = category.items[index];
              return ItemWidget(
                title: item.name,
                price: item.price,
                imageLink: item.imageLink,
                item: item,
              );
            },
          ),
        )
      ],
    );
  }
}
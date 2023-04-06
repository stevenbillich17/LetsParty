import 'package:flutter/material.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/core/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  ItemWidget({
    super.key,
    required this.title,
    this.quantity,
    required this.price,
    this.imageLink = '',
    this.quantityVisible = false,
    this.item,
  });

  final String title;
  final int? quantity;
  final double price;
  bool quantityVisible;
  String imageLink;
  final ItemModel? item;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppDimens.padding),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.padding_2x),
              child: Image.network(
                imageLink,
                height: 110.0,
                width: 110.0,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Container(
                    height: 110.0,
                    width: 110.0,
                    color: Colors.grey[200],
                  );
                },
              ),
            ),
          ),
          Text(
            title,
            style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold),
          ),
          Visibility(
            visible: quantityVisible,
            child: Text(
              '$quantity items',
              style: AppStyles.bodyStyle,
            ),
          ),
          Text(
            '${price}RON / item',
            style: AppStyles.bodyStyle,
          )
        ],
      ),
    );
  }
}
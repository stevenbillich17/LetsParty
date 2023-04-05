import 'package:flutter/material.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';

class PartyButton extends StatelessWidget {
  const PartyButton({
    super.key,
    required this.image,
    required this.name,
    required this.onPressed,
  });
  final String image;
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Stack(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 130,
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 130,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.padding),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

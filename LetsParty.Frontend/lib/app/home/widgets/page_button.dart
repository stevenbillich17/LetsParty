import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';

class PageButton extends StatelessWidget {
  const PageButton({
    super.key,
    required this.onPressed,
    required this.svgAssetPath,
    required this.text,
  });
  final VoidCallback onPressed;
  final String svgAssetPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            shadowColor: MaterialStateProperty.all(Colors.grey),
            backgroundColor: MaterialStateProperty.all(appYellow),
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.padding_2x),
            child: SvgPicture.asset(
              svgAssetPath,
              width: 30.0,
              height: 30.0,
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12.5,
          ),
        )
      ],
    );
  }
}

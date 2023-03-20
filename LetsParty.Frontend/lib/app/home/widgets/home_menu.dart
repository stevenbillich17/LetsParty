import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/home/widgets/page_button.dart';
import 'package:lets_party_frontend/gen/assets.gen.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          PageButton(
            onPressed: () {},
            svgAssetPath: Assets.lib.assets.images.createParty,
            text: 'create party',
          ),
          PageButton(
            onPressed: () {},
            svgAssetPath: Assets.lib.assets.images.myInvites,
            text: 'my invites',
          ),
          Visibility(
            visible: false,
            child: PageButton(
              onPressed: () {},
              svgAssetPath: Assets.lib.assets.images.partyGames,
              text: 'party games',
            ),
          ),
          PageButton(
            onPressed: () {},
            svgAssetPath: Assets.lib.assets.images.settings,
            text: 'settings',
          ),
        ],
      ),
    );
  }
}

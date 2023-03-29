import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/home/widgets/home_menu.dart';
import 'package:lets_party_frontend/app/home/widgets/party_button.dart';
import 'package:provider/provider.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/gen/fonts.gen.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';
import 'package:lets_party_frontend/app/home/home_screen_bloc.dart';
import 'package:lets_party_frontend/app/party_invite/party_invite_screen.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenBloc(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            leadingWidth: 100.0,
            toolbarHeight: 70.0,
            title: const Text(
              "let's party!",
              style: TextStyle(
                color: appBlack,
                fontSize: 42.0,
                fontFamily: FontFamily.keepOnTruckin,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.padding_2x,
              vertical: AppDimens.padding_2x,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeMenu(),
                  Consumer<HomeScreenBloc>(
                    builder: (context, homeScreenBloc, child) {
                      if (homeScreenBloc.goingParties.isEmpty &&
                          homeScreenBloc.hostedParties.isEmpty) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(AppDimens.padding_2x),
                            child: LinearProgressIndicator(),
                          ),
                        );
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(
                                AppDimens.padding,
                                AppDimens.padding_3x,
                                AppDimens.padding,
                                AppDimens.padding_2x,
                              ),
                              child: Text(
                                'next parties',
                                style: TextStyle(
                                  fontFamily: FontFamily.keepOnTruckin,
                                  fontSize: 35.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 175,
                              child: ListView.builder(
                                itemCount: homeScreenBloc.goingParties.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final PartyModel party =
                                      homeScreenBloc.goingParties[index];
                                  return PartyButton(
                                    image: party.pictureLink,
                                    name: party.name,
                                    onPressed: () => Navigator.push (
                                      context,
                                      MaterialPageRoute (
                                        builder: (BuildContext context) => PartyInviteScreen(party.id),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(
                                AppDimens.padding,
                                AppDimens.padding_3x,
                                AppDimens.padding,
                                AppDimens.padding_2x,
                              ),
                              child: Text(
                                'hosting',
                                style: TextStyle(
                                  fontFamily: FontFamily.keepOnTruckin,
                                  fontSize: 35.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 175,
                              child: ListView.builder(
                                itemCount: homeScreenBloc.hostedParties.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final PartyModel party =
                                      homeScreenBloc.hostedParties[index];
                                  return PartyButton(
                                    image: party.pictureLink,
                                    name: party.name,
                                    onPressed: () {},
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

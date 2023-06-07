import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/party_hosted/party_hosted_bloc.dart';
import 'package:provider/provider.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/app/components/party_description.dart';
import 'dart:math' as math;

class PartyHostedScreen extends StatelessWidget {
  PartyHostedScreen(this.partyID, this.image, {super.key});

  String partyID;
  Image? image;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PartyHostedBloc(partyID),
      child: Consumer<PartyHostedBloc>(
        builder: (context, bloc, child) {
          if (bloc.loadingDone) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  bloc.party!.name,
                  style: AppStyles.appBarStyle,
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                leading: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: appYellow,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                leadingWidth: 80.0,
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.padding_2x),
                  child: ListView(
                    children: [
                      PartyDescription(bloc.party!, bloc.hostName!, image),
                      const SizedBox(
                        height: AppDimens.padding_4x,
                      ),
                      Visibility(
                        visible: bloc.partyGuestsComming.isNotEmpty,
                        child: Column(
                          children: [
                            const Text(
                              'who comes?',
                              style: AppStyles.categoryStyle,
                            ),
                            const SizedBox(
                              height: AppDimens.padding_2x,
                            ),
                            SizedBox(
                              height: 120.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: bloc.partyGuestsComming.length,
                                itemBuilder: (context, count) {
                                  return SizedBox(
                                    width: 100.0,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(
                                              (math.Random().nextDouble() *
                                                      0xFFFFFF)
                                                  .toInt(),
                                            ).withOpacity(0.3),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          bloc.partyGuestsComming[count]
                                              .invitedEmail,
                                          softWrap: true,
                                          maxLines: null,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: bloc.partyGuestsNotComming.isNotEmpty,
                        child: Column(
                          children: [
                            const Text(
                              'who can\'t come?',
                              style: AppStyles.categoryStyle,
                            ),
                            const SizedBox(
                              height: AppDimens.padding_2x,
                            ),
                            SizedBox(
                              height: 120.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: bloc.partyGuestsNotComming.length,
                                itemBuilder: (context, count) {
                                  return SizedBox(
                                    width: 100.0,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(
                                              (math.Random().nextDouble() *
                                                  0xFFFFFF)
                                                  .toInt(),
                                            ).withOpacity(0.3),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          bloc.partyGuestsNotComming[count]
                                              .invitedEmail,
                                          softWrap: true,
                                          maxLines: null,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: bloc.partyGuestsNotComming.isNotEmpty,
                        child: Column(
                          children: [
                            const Text(
                              'did not answer yet',
                              style: AppStyles.categoryStyle,
                            ),
                            const SizedBox(
                              height: AppDimens.padding_2x,
                            ),
                            SizedBox(
                              height: 120.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: bloc.partyGuestsNotComming.length,
                                itemBuilder: (context, count) {
                                  return SizedBox(
                                    width: 100.0,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(
                                              (math.Random().nextDouble() * 0xFFFFFF)
                                                  .toInt(),
                                            ).withOpacity(0.3),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          bloc.partyGuestsNotComming[count].invitedEmail,
                                          softWrap: true,
                                          maxLines: null,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/items_page/items_page_screen.dart';
import 'package:lets_party_frontend/app/party_invite/party_invite_bloc.dart';
import 'package:lets_party_frontend/core/authentication/authenticator.dart';
import 'package:lets_party_frontend/core/repository/invitations_data.dart';
import 'package:provider/provider.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/app/components/party_description.dart';
import 'dart:math' as math;

class PartyInviteScreen extends StatelessWidget {
  PartyInviteScreen(this.partyID, this.image, {super.key});

  String partyID;
  Image? image;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PartyInviteBloc(partyID),
      child: Consumer<PartyInviteBloc>(
        builder: (context, bloc, child) {
          if (bloc.loadingDone) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  bloc.party!.name,
                  style: AppStyles.appBarStyle,
                ),
                backgroundColor: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
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
                        visible: bloc.partyGuests.isNotEmpty,
                        child: Column(
                          children: [
                            const Text(
                              'people invited',
                              style: AppStyles.categoryStyle,
                            ),
                            const SizedBox(
                              height: AppDimens.padding_2x,
                            ),
                            // PartyInfo(bloc.partyGuests),
                            SizedBox(
                              height: 120.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: bloc.partyGuests.length,
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
                                            color: Color((math.Random()
                                                .nextDouble() *
                                                0xFFFFFF)
                                                .toInt())
                                                .withOpacity(0.3),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          bloc.names[bloc.partyGuests[count].invitedEmail] ?? "",
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: bloc.currentStatus != 0,
                            child: Text(
                              bloc.currentStatus == -1
                                  ? 'You declined this invitation'
                                  : 'You have already accepted this invitation',
                              style: AppStyles.bodyStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Visibility(
                            visible: bloc.currentStatus == 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () async =>
                                      bloc.acceptInvitation(
                                          bloc.party!.id, Authenticator.email),
                                  child: Text('Accept'),
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      Size(
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width / 2 - 50,
                                        40.0,
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () async =>
                                      bloc.declineInvitation(
                                          bloc.party!.id, Authenticator.email),
                                  child: Text('Decline'),
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all(
                                      Size(
                                        MediaQuery
                                            .of(context)
                                            .size
                                            .width / 2 - 50,
                                        40.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

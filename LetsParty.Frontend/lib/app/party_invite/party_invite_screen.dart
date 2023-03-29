import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/party_invite/party_invite_bloc.dart';
import 'package:provider/provider.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/app/components/party_description.dart';


class PartyInviteScreen extends StatelessWidget {
  PartyInviteScreen(this.partyID, {super.key});

  String partyID;

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
                      PartyDescription(bloc.party!, bloc.hostName!),
                      const SizedBox(
                        height: AppDimens.padding_4x,
                      ),
                      // const Text(
                      //   'who else is coming?',
                      //   style: AppStyles.categoryStyle,
                      // ),
                      const SizedBox(
                        height: AppDimens.padding_2x,
                      ),
                      // PartyInfo(bloc.partyGuests),
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50.0),
                          ),
                        ),
                        onPressed: () {},
                        // => Navigator.push(context, MaterialPageRoute(builder: (context) => NeededItemsScreen(partyID: partyID,))),
                        child: const Text(
                          'What is needed',
                          style: AppStyles.bodyStyle,
                        ),
                      )
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
     /* return Scaffold(
        appBar: AppBar(
          title: Text(
            party!.name,
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
                // PartyDescription(party!, hostName!),
                const SizedBox(
                  height: AppDimens.padding_4x,
                ),
                const Text(
                  'who else is coming?',
                  style: AppStyles.categoryStyle,
                ),
                const SizedBox(
                  height: AppDimens.padding_2x,
                ),
                // PartyInfo(bloc.partyGuests),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50.0),
                    ),
                  ),
                  onPressed: () {},
                  // => Navigator.push(context, MaterialPageRoute(builder: (context) => NeededItemsScreen(partyID: partyID,))),
                  child: const Text(
                    'What is needed',
                    style: AppStyles.bodyStyle,
                  ),
                )
              ],
            ),
          ),
        ),
      );*/
  }
}

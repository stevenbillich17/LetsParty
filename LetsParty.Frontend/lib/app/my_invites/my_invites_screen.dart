import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/my_invites/my_invites_bloc.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:provider/provider.dart';

import 'package:lets_party_frontend/app/components/string_mixins.dart';

import 'package:lets_party_frontend/core/models/party_model.dart';

class MyInvites extends StatelessWidget with StringMixins {
  const MyInvites({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.75;

    return ChangeNotifierProvider(
      create: (context) => MyInvitesBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'my invites',
            style: AppStyles.appBarStyle,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: TextButton(
            child: const Text('Back'),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.padding_2x),
            child: Consumer<MyInvitesBloc>(
              builder: (context, bloc, child) {
                if (bloc.isLoadingDone == false) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (bloc.partyIDs.isEmpty) {
                  return const Center(
                    child: Text(
                      'You have no new invites',
                      style: AppStyles.bodyStyle,
                    ),
                  );
                }
                return SizedBox(
                  height: height,
                  child: ListView.builder(
                    itemCount: bloc.partyIDs.length,
                    itemBuilder: (context, index) {
                      // return Text(bloc.partyIDs[index]);
                      final PartyModel party = bloc.invitedParties[index];
                      return RawMaterialButton(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              party.name,
                              style: AppStyles.categoryStyle
                                  .copyWith(fontSize: 24.0),
                            ),
                            const SizedBox(
                              height: AppDimens.padding / 2,
                            ),
                            Text(
                              'on ${formatDate(party.when)}, at ${party.where}',
                              style: AppStyles.bodyStyle,
                            ),
                            const SizedBox(
                              height: AppDimens.padding,
                            ),
                            const Divider(
                              thickness: 2.0,
                            ),
                          ],
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Container(),
                          ),
                        ),
                      );
                    },
                  ),
                );
                // return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}

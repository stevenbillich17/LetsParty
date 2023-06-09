import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/components/input_field_widgets.dart';
import 'package:lets_party_frontend/app/create_party/create_party_bloc.dart';
import 'package:lets_party_frontend/app/create_party/image_picking_zone.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/app/home/home_screen.dart';

class CreatePartyScreen extends StatelessWidget {
  CreatePartyScreen({super.key});

  final bloc = CreatePartyBloc();
  final dateRegex = RegExp(r'(\d{4}-\d{2}-\d{2})');
  static const TextStyle _labelStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => bloc,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0.0,
            leadingWidth: 100.0,
            toolbarHeight: 80.0,
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
            title: const Text('create party', style: AppStyles.appBarStyle),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(
              AppDimens.padding_2x,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImagePickingZone(
                    bloc: bloc,
                  ),
                  const SizedBox(
                    height: AppDimens.padding_2x,
                  ),
                  const Text(
                    'Name',
                    style: _labelStyle,
                  ),
                  const SizedBox(
                    height: AppDimens.padding,
                  ),
                  InputField(
                    hintText: 'Give your party a name',
                    onChanged: (val) {
                      bloc.name = val;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (description) {
                      if (description != null && description != '') {
                        return null;
                      }
                      return 'Invalid description';
                    },
                  ),
                  const SizedBox(
                    height: AppDimens.padding_2x,
                  ),
                  const Text(
                    'How',
                    style: _labelStyle,
                  ),
                  const SizedBox(
                    height: AppDimens.padding,
                  ),
                  InputField(
                    hintText: 'Create short description',
                    onChanged: (val) {
                      bloc.description = val;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (description) {
                      if (description != null && description != '') {
                        return null;
                      }
                      return 'Invalid description';
                    },
                  ),
                  const SizedBox(
                    height: AppDimens.padding_2x,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'WHEN',
                            style: _labelStyle,
                          ),
                          Consumer<CreatePartyBloc>(
                            builder: (context, cpb, child) => ElevatedButton(
                              onPressed: () async {
                                await cpb.pickDate(context);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  appYellow.withOpacity(0.5),
                                ),
                              ),
                              child: Text(
                                cpb.when != null
                                    ? CreatePartyBloc.getDateFormatted(
                                        cpb.when!,
                                      )
                                    : 'Choose date',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppDimens.padding_2x,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'RSVP',
                            style: _labelStyle,
                          ),
                          Consumer<CreatePartyBloc>(
                            builder: (context, cpb, child) => ElevatedButton(
                              onPressed: () async {
                                await cpb.pickRsvpDate(context);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  appYellow.withOpacity(0.5),
                                ),
                              ),
                              child: Text(
                                cpb.rsvp != null
                                    ? CreatePartyBloc.getDateFormatted(
                                        cpb.rsvp!,
                                      )
                                    : 'Choose date',
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppDimens.padding_2x,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    'Where',
                    style: _labelStyle,
                  ),
                  const SizedBox(
                    height: AppDimens.padding,
                  ),
                  InputField(
                    hintText: "Enter the party's location",
                    onChanged: (val) {
                      bloc.where = val;
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: (description) {
                      if (description != null && description != '') {
                        return null;
                      }
                      return 'Invalid description';
                    },
                  ),
                  const SizedBox(
                    height: AppDimens.padding_2x,
                  ),
                  const Text(
                    'Create tags (optional)',
                    style: _labelStyle,
                  ),
                  const SizedBox(
                    height: AppDimens.padding,
                  ),
                  InputField(
                    hintText: 'Separate tags with commas',
                    onChanged: (val) {
                      if (val != null) {
                        bloc.tags = val;
                      }
                    },
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (description) {
                      if (description != null && description != '') {
                        return null;
                      }
                      return 'Invalid description';
                    },
                  ),
                  const SizedBox(
                    height: AppDimens.padding_8x,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(AppDimens.padding_2x),
            child: ElevatedButton(
              onPressed: () async {
                await bloc.createParty();
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(
                    MediaQuery.of(context).size.width,
                    55,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimens.roundedButtonCorners),
                  ),
                ),
              ),
              child: const Text(
                'Next: Invite people',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}

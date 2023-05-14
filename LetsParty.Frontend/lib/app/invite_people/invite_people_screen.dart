import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/create_party/create_party_bloc.dart';
import 'package:lets_party_frontend/app/invite_people/invite_people_bloc.dart';
import 'package:lets_party_frontend/app/invite_people/widgets/user_placeholder.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/core/models/user_model.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/gen/fonts.gen.dart';
import 'package:provider/provider.dart';

class InvitePeopleScreen extends StatelessWidget {
  CreatePartyBloc createPartyBloc;
  List<UserModel> listOfInvitedUsers = [];

  InvitePeopleScreen({required this.createPartyBloc});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SafeArea(
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
          title: const Text(
            'invite people',
            style: TextStyle(
              color: appBlack,
              fontSize: 42.0,
              fontFamily: FontFamily.keepOnTruckin,
            ),
          ),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider(
          create: (context) => InvitePeopleBloc(),
          child: Column(
            children: [
              const Center(
                child: Text(
                  'total invited: 5',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppDimens.padding_2x,
                  horizontal: AppDimens.padding_2x,
                ),
                child: Column(
                  children: [
                    Consumer<InvitePeopleBloc>(builder: (context, bloc, child) {
                      if (bloc.isLoadingDone == false) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return SizedBox(
                          height: height * 0.75,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: bloc.friends.length,
                            itemBuilder: (context, index) {
                              final UserModel userModel = bloc.friends[index];
                              return Column(
                                children: [
                                  user_placeholder(
                                    width: width,
                                    email: userModel.email!,
                                    name: userModel.name!,
                                    onInvitePressed: () {
                                      listOfInvitedUsers.add(
                                          UserModel.allFields(
                                              name: userModel.name!,
                                              email: userModel.email!,
                                              birthday: userModel.birthday!));
                                    },
                                  ),
                                  const SizedBox(
                                    height: AppDimens.padding_2x,
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      }
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(AppDimens.padding_2x),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Container()));
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
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
            ),
            child: const Text(
              'Next: What is needed',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'settings',
            style: AppStyles.appBarStyle,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leadingWidth: 80.0,
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
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppDimens.padding_2x),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              MaterialButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Container(),
                  ),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimens.padding_2x,
                    ),
                    child: Text(
                      'Edit your profile',
                      style: AppStyles.bodyStyle,
                    ),
                  ),
                ),
              ),
              const Divider(),
              MaterialButton(
                onPressed: () async {},
                child: const SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppDimens.padding_2x,
                    ),
                    child: Text(
                      'Log Out',
                      style: AppStyles.bodyStyle,
                    ),
                  ),
                ),
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}

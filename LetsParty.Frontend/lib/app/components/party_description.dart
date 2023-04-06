import 'package:flutter/material.dart';
import 'package:lets_party_frontend/app/components/string_mixins.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';
import 'package:lets_party_frontend/assets/app_styles.dart';
import 'package:lets_party_frontend/core/models/party_model.dart';

class PartyDescription extends StatelessWidget with StringMixins {
  PartyDescription(this.party, this.hostName, {super.key});

  PartyModel party;
  String hostName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppDimens.roundedCorners),
          child: SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              party.pictureLink,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return Container(
                  color: Colors.grey[200],
                );
              },
            ),
          ),

        ),
        const SizedBox(
          height: AppDimens.padding_2x,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            party.hostEmail == null
                ? 'Unknown host'
                : 'Party hosted by $hostName',
            textAlign: TextAlign.center,
            style: AppStyles.bodyStyle,
          ),
        ),
        const SizedBox(
          height: AppDimens.padding_2x,
        ),
        SizedBox(
          height: 30.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: party.tags == null ? 0 : party.tags.length,
            itemBuilder: (context, count) {
              return Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      // fixedSize: MaterialStateProperty.all(Size())
                      elevation: MaterialStateProperty.all(0.0),
                      enableFeedback: false,
                    ),
                    child: Text(
                      party.tags[count],
                      style: AppStyles.bodyStyle,
                    ),
                  ),
                  const SizedBox(
                    width: AppDimens.padding,
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: AppDimens.padding_3x,
        ),
        Text(
          'Description',
          style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: AppDimens.padding,
        ),
        Text(
          party.description,
          style: AppStyles.bodyStyle,
        ),
        const SizedBox(
          height: AppDimens.padding_3x,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'When',
                    style: AppStyles.bodyStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppDimens.padding_2x,
                  ),
                  Text(
                    party.when != null
                        ? formatDate(party.when)
                        : ' No date yet',
                    style: AppStyles.bodyStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Where',
                    style: AppStyles.bodyStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: AppDimens.padding_2x,
                  ),
                  Text(
                    party.where,
                    style: AppStyles.bodyStyle,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

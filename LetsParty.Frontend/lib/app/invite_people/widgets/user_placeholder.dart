import 'package:flutter/material.dart';
import 'package:lets_party_frontend/assets/app_colors.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';

class user_placeholder extends StatefulWidget {
  user_placeholder({
    Key? key,
    required this.width,
    required this.name,
    required this.email,
    required this.onInvitePressed,
  }) : super(key: key);

  final double width;
  final String name;
  final String email;
  final VoidCallback onInvitePressed;

  @override
  State<user_placeholder> createState() => _user_placeholderState();
}

class _user_placeholderState extends State<user_placeholder> {
  bool pressed = false;
  String imageURL = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

  @override
  void initState() {
    super.initState();
    setImageUrl();
  }

  Future<void> setImageUrl () async {
    imageURL = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
    // todo: should change image url with the one from the backend
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width * 0.150,
          child: CircleAvatar(
            backgroundColor: appYellow,
            radius: widget.width * 0.065,
            child: CircleAvatar(
              radius: widget.width * 0.055,
              backgroundImage: NetworkImage(
                  imageURL == null ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png' : imageURL),
            ),
          ),
        ),
        const SizedBox(
          width: AppDimens.padding_2x,
        ),
        SizedBox(
          width: widget.width * 0.45,
          child: Text(
            widget.name,
            style: TextStyle(fontSize: widget.width * 0.050),
          ),
        ),
        const SizedBox(
          width: AppDimens.padding_4x,
        ),
        Expanded(
          child: Center(
            child: OutlinedButton(
              onPressed: () {
                widget.onInvitePressed.call();
                setState(() {
                  pressed = true;
                });
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                side: MaterialStateProperty.all(const BorderSide(width: 3.0, color: appYellow, style: BorderStyle.solid)),
                backgroundColor: pressed ? MaterialStateProperty.all(appYellow) : MaterialStateProperty.all(Colors.white),
              ),
              child: Text(
                "Invite",
                style: TextStyle(
                    fontSize: widget.width * 0.045,
                    color: pressed ? Colors.white : appYellow
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
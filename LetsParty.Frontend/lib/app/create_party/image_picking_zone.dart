import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lets_party_frontend/app/create_party/create_party_bloc.dart';
import 'package:lets_party_frontend/assets/app_dimens.dart';

class ImagePickingZone extends StatefulWidget {
  ImagePickingZone({super.key, required this.bloc});

  CreatePartyBloc bloc;

  @override
  _ImagePickingZoneState createState() => _ImagePickingZoneState();
}

class _ImagePickingZoneState extends State<ImagePickingZone> {
  File? image;
  bool? isImagedPicked = false;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      widget.bloc.imageFile = image.path;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
      isImagedPicked = true;
    } on PlatformException {
      image = null;
    }
  }

  /// Used to get image from camera
  Future pickImageFromCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException {
      image = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 0.0, horizontal: AppDimens.padding_2x),
      child: GestureDetector(
        onTap: () {
          pickImage();
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              image: image != null
                  ? DecorationImage(
                      image: FileImage(image!),
                      fit: BoxFit.cover,
                    )
                  : null,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: image == null
                ? const Center(
                    child: Text(
                      'Add picture',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimens.padding,
                      horizontal: AppDimens.padding,
                    ),
                    child: Text(
                      'change photo',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../authentication/authenticator.dart';

class ImageData {
  String apiPath = 'http://10.0.2.2:8081/api/v1';

  Map<String, String> headers = {
    "Authorization": "Bearer ${Authenticator.token}"
  };

  Future<Image> getImageById(String imageId) async {
    final response = await http.get(Uri.parse('$apiPath/files/$imageId'), headers: headers);
    print(response.bodyBytes);
    if (response.statusCode == 200) {
      final Uint8List imageBytes = response.bodyBytes;
      final imageWidget = Image.memory(imageBytes);
      return imageWidget;
    } else {
      throw Exception('Failed to load data.');
    }
  }
}
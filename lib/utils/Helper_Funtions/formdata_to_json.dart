
 import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
class TextAndImageConversion {
  Map<String, dynamic> formDataToJson(FormData formData) {
    Map<String, dynamic> jsonObject = {};
    for (MapEntry<String, dynamic> entry in formData.fields) {
      if (
          entry.key == 'currentAmount' ||
          entry.key == 'categoryId' ||
          entry.key == 'userId' ||
          entry.key == 'view') {
        jsonObject[entry.key] =
            int.tryParse(entry.value) ?? 0;
      } else if (entry.key == 'image' || entry.key == 'documents') {
        List<String> urls = List<String>.from(entry.value);
        jsonObject[entry.key] = urls;
      } else {
        jsonObject[entry.key] = entry.value;
      }
    }

    return jsonObject;
  }

  String convertImageToBase64(Uint8List imageBytes) {
    return base64Encode(imageBytes);
  }
}

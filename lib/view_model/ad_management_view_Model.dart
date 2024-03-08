import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../core/const/base_url.dart';
import '../core/routes/routes_name.dart';
import '../utils/Helper_Funtions/formdata_to_json.dart';
import '../utils/toast_utils.dart';
import 'package:image/image.dart' as img;

class AdsViewModel extends ChangeNotifier {
  TextEditingController adTitle = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController description = TextEditingController();
  final GlobalKey<FormState> formKeys = GlobalKey<FormState>();
  List<Uint8List> fileBytesList = [];
  List<String> fileNamesList = [];

  var adsType;

  bool addAds = false;
  Dio dio = Dio();

  void reset() {
    fileBytesList.clear();
    fileNamesList.clear();
  }

  Uint8List resizeImage(Uint8List imageBytes, double targetWidth, double targetHeight) {
    img.Image image = img.decodeImage(imageBytes)!;
    double aspectRatio = image.width / image.height;
    double resizeWidth = targetWidth;
    double resizeHeight = resizeWidth / aspectRatio;
    if (resizeHeight > targetHeight) {
      resizeHeight = targetHeight;
      resizeWidth = resizeHeight * aspectRatio;
    }
    img.Image resizedImage =
        img.copyResize(image, width: resizeWidth.toInt(), height: resizeHeight.toInt());
    return Uint8List.fromList(img.encodeJpg(resizedImage));
  }

  Future<void> documentUpload(BuildContext context) async {
    try {
      if (fileBytesList.isNotEmpty && fileNamesList.isNotEmpty) {
      } else {
        ToastUtils().showCherryToast(context, 'Please upload BannerImage', true);
      }
    } catch (e) {}
  }

  Future<void> pickFiles(BuildContext context) async {
    FilePickerResult? result = await FilePickerWeb.platform.pickFiles();

    if (result != null) {
      fileBytesList.clear();
      fileNamesList.clear();

      fileBytesList.add(result.files.single.bytes!);
      fileNamesList.add(result.files.single.name);
    }
    notifyListeners();
  }

  Future<void> uploadAd(BuildContext context) async {
    Size size = MediaQuery.of(context).size;

    try {
      Uint8List resizedImageBytes;

      switch (adsType) {
        case 'BANNER':
          resizedImageBytes = resizeImage(
            fileBytesList[0],
            size.width * 0.5,
                                    size.height * 0.151,
          );
          break;
        case 'HALFBANNER':
          resizedImageBytes = resizeImage(
            fileBytesList[0],
            size.width * 0.228,
            size.height * 0.151,
          );
          break;
        case 'CARD':
          resizedImageBytes = resizeImage(
            fileBytesList[0],
            size.width * 0.092,
            size.height * 0.31,
          );
          break;
        default:
          throw Exception('Invalid ad type');
      }

      FormData formData = FormData.fromMap({
        "title": adTitle.text,
        "description": description.text,
        "activity": "ACTIVE",
        "type": adsType,
        "companyName": companyName.text,
        "imageUrl": resizedImageBytes,
        // "imageUrl": [Uri.dataFromBytes(resizedImageBytes)],
        "startDate": DateTime.now().toIso8601String(),
        "endDate": DateTime.now().add(const Duration(days: 5))
      });

      Map<String, dynamic> jsonData = TextAndImageConversion().formDataToJson(formData);
      print('JSON Data: $jsonData');

      Response response = await dio.post(
        '${ApiUrl.baseUrl}ads',
        data: jsonData,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Data uploaded successfully');
        print('Response: ${response.data}');
        Navigator.pushNamed(context, RouteName.dashboard);
      } else {
        print('Failed to upload data. Status code: ${response.statusCode}');
        Navigator.pushNamed(context, RouteName.adsmanagement);
      }
    } catch (e) {
      print('Error occurred during data upload: $e');
    }
  }

  // Future<String> uploadImage(Uint8List imageBytes) async {
  //   final formData = FormData.fromMap({
  //     'image': MultipartFile.fromBytes(
  //       imageBytes,
  //       filename: 'image.png',
  //       contentType: MediaType('image', 'png'),
  //     ),
  //   });

  //   final response = await dio.post(
  //     '${ApiUrl.baseUrl}uploads',
  //     data: formData,
  //     options: Options(
  //       headers: {
  //         'Content-Type': 'multipart/form-data',
  //       },
  //     ),
  //   );

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     return response.data['url'];
  //   } else {
  //     throw Exception('Failed to upload image');
  //   }
  // }

  // Future<void> uploadAd(BuildContext context) async {
  //   Size size = MediaQuery.of(context).size;

  //   try {
  //     Uint8List resizedImageBytes =
  //         resizeImage(fileBytesList[0], size.width * 0.5, size.height * 0.151);

  //     FormData formData = FormData.fromMap({
  //       "title": adTitle.text,
  //       "description": description.text,
  //       "activity": "ACTIVE",
  //       "type": "$adsType",
  //       "companyName": companyName.text,
  //       "imageUrl": [Uri.dataFromBytes(resizedImageBytes)],
  //       "startDate": DateTime.now().toIso8601String(),
  //       "endDate": DateTime.now().toIso8601String()
  //     });

  //     Map<String, dynamic> jsonData = TextAndImageConversion().formDataToJson(formData);
  //     print('JSON Data: $jsonData');

  //     Response response = await dio.post(
  //       '${ApiUrl.baseUrl}ads',
  //       data: jsonData,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       print('Data uploaded successfully');
  //       print('Response: ${response.data}');
  //       Navigator.pushNamed(context, RouteName.dashboard);
  //     } else {
  //       print('Failed to upload data. Status code: ${response.statusCode}');
  //       Navigator.pushNamed(context, RouteName.adsmanagement);
  //     }
  //   } catch (e) {
  //     print('Error occurred during data upload: $e');
  //   }
  // }
}

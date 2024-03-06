  import 'dart:typed_data';

import 'package:cloudinary/cloudinary.dart';

Future<List<String>> uploadFilesToCloudinary(List<Uint8List> fileBytesList) async {
    Dio dio = Dio();
    List<String> urls = [];

    for (var fileBytes in fileBytesList) {
      FormData formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(fileBytes, filename: 'file'),
        'upload_preset': 'avelf4lq',
      });

      Response response = await dio.post(
        'https://api.cloudinary.com/v1_1/dsrapcvkq/image/upload',
        data: formData,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        String fileUrl = data['secure_url'];
        urls.add(fileUrl);
      } else {
        print('Failed to upload to Cloudinary. Status code: ${response.statusCode}');
      }
    }

    return urls;
  }

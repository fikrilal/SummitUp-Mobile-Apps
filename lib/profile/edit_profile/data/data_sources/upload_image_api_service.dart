import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

Future<void> uploadImage(File imageFile, int userId) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('http://summitup.id/api/app/upload_image.php'),
  );

  request.files.add(
    http.MultipartFile(
      'fileToUpload',
      imageFile.readAsBytes().asStream(),
      imageFile.lengthSync(),
      filename: basename(imageFile.path),
    ),
  );

  request.fields['user_id'] = userId.toString();

  var response = await request.send();

  if (response.statusCode == 200) {
    print('Image uploaded successfully.');
  } else {
    print('Image upload failed.');
  }

  var responseData = await response.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  print(responseString);
}

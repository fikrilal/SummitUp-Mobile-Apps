import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/midtrans_token_model.dart';
import '../utils/failure.dart';

class TokenService {
  Future<Either<Failure, TokenModel>> getToken({
    required String productName,
    required int price,
    required int quantity,
  }) async {
    var apiUrl = dotenv.env['BASE_URL'] ?? '';

    // Payload
    var payload = {
      "id": DateTime.now().millisecondsSinceEpoch, // Unique Id
      "productName": productName,
      "price": price,
      "quantity": quantity
    };

    var payloadJson = jsonEncode(payload);

    try {
      print("Sending payload: $payloadJson"); // Print payload for debugging
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: payloadJson,
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print("Response: $jsonResponse"); // Print response for debugging
        return right(TokenModel(token: jsonResponse['token']));
      } else {
        print("Failed to get token: ${response.body}");
        return left(ServerFailure(
            data: response.body,
            code: response.statusCode,
            message: 'Unknown Error'));
      }
    } catch (e) {
      print("Exception: $e");
      return left(ServerFailure(
          data: e.toString(), code: 400, message: 'Unknown Error'));
    }
  }
}

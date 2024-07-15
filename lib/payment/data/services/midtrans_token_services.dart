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
    required int bookingId,
    required int userId,
  }) async {
    var apiUrl = dotenv.env['BASE_URL'] ?? '';
    var apiTransaction = dotenv.env['API_URL'] ?? '';

    // Create transaction record in the backend
    final transactionId = DateTime.now().millisecondsSinceEpoch;
    final transactionData = {
      'id': transactionId,
      'booking_id': bookingId,
      'user_id': userId,
      'amount': price,
    };

    var createTransactionApiUrl = '$apiTransaction/create_booking_transaction.php';
    var transactionResponse = await http.post(
      Uri.parse(createTransactionApiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(transactionData),
    );

    if (transactionResponse.statusCode != 201) {
      return left(ServerFailure(
        data: transactionResponse.body,
        code: transactionResponse.statusCode,
        message: 'Failed to create transaction record',
      ));
    }

    // Payload for Midtrans
    var payload = {
      "id": transactionId, // Use the same Unique ID
      "productName": productName,
      "price": price,
      "quantity": quantity,
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
        return right(TokenModel(token: jsonResponse['token'], id: transactionId));
      } else {
        print("(token service) Failed to get token: ${response.body}");
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

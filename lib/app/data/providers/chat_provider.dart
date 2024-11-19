import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatProvider extends GetConnect {
  final String baseUrl = 'YOUR_API_BASE_URL';

  Future<Response> sendMessage(String message) async {
    try {
      final response = await post(
        '$baseUrl/chat',
        {
          'message': message,
          'userId': 'user123', // Implement actual user ID
        },
      );
      return response;
    } catch (e) {
      return Response(statusCode: 500, body: {'error': e.toString()});
    }
  }

  Future<Response> bookAngkot(Map<String, dynamic> bookingData) async {
    try {
      final response = await post(
        '$baseUrl/booking',
        bookingData,
      );
      return response;
    } catch (e) {
      return Response(statusCode: 500, body: {'error': e.toString()});
    }
  }
}

import 'package:get/get.dart';
import '../providers/chat_provider.dart';
import '../models/chat_message.dart';

class ChatRepository {
  final ChatProvider provider;

  ChatRepository({required this.provider});

  Future<String> processMessage(String message) async {
    try {
      final response = await provider.sendMessage(message);
      if (response.status.hasError) {
        return 'Maaf, terjadi kesalahan. Silakan coba lagi.';
      }
      return response.body['response'] ?? 'Tidak ada respons dari server';
    } catch (e) {
      return 'Terjadi kesalahan: ${e.toString()}';
    }
  }

  Future<Map<String, dynamic>> bookAngkot(
      Map<String, dynamic> bookingData) async {
    try {
      final response = await provider.bookAngkot(bookingData);
      if (response.status.hasError) {
        return {'success': false, 'message': 'Gagal melakukan pemesanan'};
      }
      return response.body;
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }
}

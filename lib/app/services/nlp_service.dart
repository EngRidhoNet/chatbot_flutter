import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart' as df;

class NLPService {
  late df.DialogFlowtter _dialogFlowtter;

  /// Inisialisasi DialogFlowtter dengan file JSON untuk autentikasi
  Future<void> initialize() async {
    try {
      // Membaca file JSON dari assets
      String credentialsJson =
          await rootBundle.loadString('assets/dialog_flow_auth.json');
      Map<String, dynamic> credentials = json.decode(credentialsJson);

      // Inisialisasi DialogFlowtter dengan konfigurasi dari JSON
      _dialogFlowtter = await df.DialogFlowtter.fromJson(credentials);
      print("DialogFlowtter initialized successfully.");
    } catch (e) {
      print('Error initializing DialogFlowtter: $e');
      throw Exception('Failed to initialize DialogFlowtter: $e');
    }
  }

  /// Mengirim pesan ke DialogFlow dan mendapatkan respon
  Future<df.DetectIntentResponse?> detectIntent(String message) async {
    try {
      final queryInput = df.QueryInput(
        text: df.TextInput(
          text: message,
          languageCode: "id", // Ganti dengan bahasa sesuai kebutuhan
        ),
      );

      final response = await _dialogFlowtter.detectIntent(
        queryInput: queryInput,
      );

      if (response.message != null) {
        print("Response from DialogFlow: ${response.message}");
      } else {
        print("No response message from DialogFlow.");
      }

      return response;
    } catch (e) {
      print('Error detecting intent: $e');
      return null;
    }
  }

  /// Membersihkan resource DialogFlowtter
  void dispose() {
    try {
      _dialogFlowtter.dispose();
      print("DialogFlowtter disposed successfully.");
    } catch (e) {
      print("Error during disposing DialogFlowtter: $e");
    }
  }
}

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/chat_message.dart';
import '../data/repositories/chat_repository.dart';
import '../services/nlp_service.dart';

class ChatController extends GetxController {
  final ChatRepository repository;
  final NLPService nlpService;

  ChatController({
    required this.repository,
    required this.nlpService,
  });

  final messages = <ChatMessage>[].obs;
  final isLoading = false.obs;
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    nlpService.initialize();
    // Add welcome message
    messages.add(ChatMessage(
      text: 'Halo! Saya asisten Angkot Anda. Apa yang bisa saya bantu?',
      isUser: false,
      timestamp: DateTime.now(),
    ));
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Add user message
    messages.insert(
        0,
        ChatMessage(
          text: text,
          isUser: true,
          timestamp: DateTime.now(),
        ));

    isLoading.value = true;
    try {
      final intentResponse = await nlpService.detectIntent(text);
      final response = await _processIntent(intentResponse!);

      messages.insert(
          0,
          ChatMessage(
            text: response,
            isUser: false,
            timestamp: DateTime.now(),
          ));
    } catch (e) {
      messages.insert(
          0,
          ChatMessage(
            text: 'Maaf, terjadi kesalahan. Silakan coba lagi.',
            isUser: false,
            timestamp: DateTime.now(),
          ));
    } finally {
      isLoading.value = false;
    }
  }

  Future<String> _processIntent(DetectIntentResponse intentResponse) async {
    final intent = intentResponse.queryResult?.intent?.displayName;

    switch (intent) {
      case 'booking_angkot':
        return _handleBooking(intentResponse);
      case 'check_route':
        return _handleRouteCheck(intentResponse);
      default:
        return intentResponse.queryResult?.fulfillmentMessages?.first.text?.text?.first ??
            'Maaf, saya tidak mengerti. Bisa tolong jelaskan lebih detail?';
    }
  }

  Future<String> _handleBooking(DetectIntentResponse response) async {
    // Extract booking parameters and process booking
    final parameters = response.queryResult?.parameters;
    // Implement booking logic
    return 'Sedang memproses pemesanan angkot Anda...';
  }

  Future<String> _handleRouteCheck(DetectIntentResponse response) async {
    // Extract route parameters and check availability
    final parameters = response.queryResult?.parameters;
    // Implement route checking logic
    return 'Mengecek rute yang tersedia...';
  }
}

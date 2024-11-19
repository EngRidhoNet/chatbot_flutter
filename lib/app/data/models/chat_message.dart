import 'package:get/get.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final String? type; // 'text', 'booking', 'route_info'

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.type = 'text',
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'isUser': isUser,
        'timestamp': timestamp.toIso8601String(),
        'type': type,
      };

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        text: json['text'],
        isUser: json['isUser'],
        timestamp: DateTime.parse(json['timestamp']),
        type: json['type'],
      );
}

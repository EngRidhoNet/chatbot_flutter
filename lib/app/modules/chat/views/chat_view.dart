import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/chat_controller.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot Angkot'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Show info dialog
              Get.dialog(
                AlertDialog(
                  title: Text('Bantuan'),
                  content: Text('Anda dapat menanyakan tentang:\n'
                      '- Pemesanan angkot\n'
                      '- Informasi rute\n'
                      '- Tarif perjalanan\n'
                      '- Status pesanan'),
                  actions: [
                    TextButton(
                      child: Text('Tutup'),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                reverse: true,
                controller: controller.scrollController,
                itemCount: controller.messages.length,
                itemBuilder: (context, index) => ChatBubble(
                  message: controller.messages[index],
                ),
              ),
            ),
          ),
          ChatInput(
            onSend: controller.sendMessage,
            isLoading: controller.isLoading,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ChatInput extends StatelessWidget {
  final Function(String) onSend;
  final RxBool isLoading;

  ChatInput({required this.onSend, required this.isLoading});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Ketik pesan...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
              ),
              minLines: 1,
              maxLines: 5,
            ),
          ),
          SizedBox(width: 8),
          Obx(() => IconButton(
                icon: isLoading.value
                    ? CircularProgressIndicator()
                    : Icon(Icons.send, color: Colors.blue),
                onPressed: isLoading.value
                    ? null
                    : () {
                        if (textController.text.isNotEmpty) {
                          onSend(textController.text);
                          textController.clear();
                        }
                      },
              )),
        ],
      ),
    );
  }
}

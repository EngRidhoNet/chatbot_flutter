import 'package:get/get.dart';
import '../modules/chat/views/chat_view.dart';
import '../bindings/chat_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/chat',
      page: () => ChatView(),
      binding: ChatBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import '../controllers/chat_controller.dart';
import '../data/providers/chat_provider.dart';
import '../data/repositories/chat_repository.dart';
import '../services/nlp_service.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatProvider());
    Get.lazyPut(() => NLPService());
    Get.lazyPut(() => ChatRepository(provider: Get.find()));
    Get.lazyPut(() => ChatController(
          repository: Get.find(),
          nlpService: Get.find(),
        ));
  }
}

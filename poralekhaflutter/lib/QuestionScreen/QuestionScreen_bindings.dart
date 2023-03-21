import 'package:get/get.dart';
import './QuestionScreen_controller.dart';

class QuestionScreenBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(QuestionScreenController());
  }
}

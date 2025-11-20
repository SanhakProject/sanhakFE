import 'package:get/get.dart';

class ResultScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxInt correctNotes = 0.obs;
  RxInt wrongNotes = 0.obs;
  RxInt combo = 0.obs;

  Future<void> fetchResultData() async {
  }
}
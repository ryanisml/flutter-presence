import 'package:get/get.dart';
import 'package:flutter_presence/app/controllers/presence_controller.dart';
import 'package:flutter_presence/app/routes/app_pages.dart';

class PageCustomController extends GetxController {
  final presenceController = Get.find<PresenceController>();
  RxInt pageIndex = 0.obs;

  void changePage(int index) async {
    pageIndex.value = index;
    switch (index) {
      case 1:
        presenceController.presence();
        break;
      case 2:
        Get.offAllNamed(Routes.profile);
        break;
      default:
        Get.offAllNamed(Routes.home);
        break;
    }
  }
}

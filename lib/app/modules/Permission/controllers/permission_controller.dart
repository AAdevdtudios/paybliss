import 'package:get/get.dart';
import 'package:paybliss/app/modules/home/views/home_view.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController {
  setPermissions() async {
    Map<Permission, PermissionStatus> status =
        await [Permission.notification].request();
    if (status.isNotEmpty) {
      print(status);
    }
    Get.offAll(const HomeView());
  }
}

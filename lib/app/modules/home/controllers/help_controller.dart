import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpController extends GetxController {
  launchWhatsapp() async {
    var whatsapp = "+2347011401387";
    var whatsappAndroid =
        Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
    if (await canLaunchUrl(whatsappAndroid)) {
      await launchUrl(whatsappAndroid);
    } else {
      Get.snackbar("Error", "Cant load Whatsapp");
    }
  }
}

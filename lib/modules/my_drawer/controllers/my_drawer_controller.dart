import 'dart:ui';
import 'package:netflix/helpers/custom_loading.dart';
import 'package:netflix/helpers/sharedPref.dart';
import 'package:netflix/modules/start/controllers/start_controller.dart';
import 'package:get/get.dart';
import 'package:netflix/translations/langs_controller.dart';
import 'package:netflix/translations/strings_enum.dart';


class MyDrawerController extends GetxController {

  void changeLang(){
    if(PreferenceUtils.getCurrentLocale() == const Locale("ar", "AR")){
      LangsController().updateLanguage(const Locale("en", "UA"));
    }else{
      LangsController().updateLanguage(const Locale("ar", "AR"));
    }
  }


  void logout(){
   
    CustomLoading.showSuccessToast(msg: Strings.Signed_out_success.tr);
    Get.find<StartController>().closeDrawer();
    update(["login&register", "logout"]);
  }


  void updateDrawer(){
    update(["login&register", "logout"]);
  }

  @override
  void onInit() {
    super.onInit();
  }

}

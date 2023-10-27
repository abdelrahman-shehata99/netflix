import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/helpers/const_dimen.dart';
import 'package:netflix/helpers/dialog_utils.dart';
import 'package:netflix/helpers/sharedPref.dart';
import 'package:netflix/modules/start/controllers/start_controller.dart';
import 'package:netflix/modules/my_drawer/controllers/my_drawer_controller.dart';
import 'package:netflix/routes/app_pages.dart';
import 'package:netflix/theme/lightColors.dart';
import 'package:netflix/translations/strings_enum.dart';

class MyDrawerView extends GetView<MyDrawerController> {

  Widget listItem(String title, Function onTap){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: ()=> onTap(),
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w100)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.find<StartController>().closeDrawer(),
        child: Container(
          color: Colors.blueAccent,
          child: Stack(
            children: [
              // Positioned.directional(
              //     bottom: 0,
              //     start: -15,
              //     textDirection: Directionality.of(context),
              //     child: Image.asset('assets/images/plant.png', width: 100, height: 166,)),
              Container(
                width: size.width * 0.66,
                padding: EdgeInsets.symmetric(vertical: DimenConst.drawerPaddingVertical, horizontal: DimenConst.drawerPaddingHorizontal),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                                if(!PreferenceUtils.getUserIsLogged()) {
                                  DialogUtils.showConfirmDialog(
                                      Get.context!,
                                      title: Strings.You_are_not_logged_in.tr,
                                      body: Strings.You_must_be_logged.tr,
                                      isDelete: false,
                                      textButton: Strings.Login.tr,
                                      onConfirm: () {
                                        Get.back();
                                        Get.toNamed(Routes.LOGIN);
                                      });
                                  return;
                                }
                                Get.toNamed(Routes.USER_PROFILE);
                              },
                              child: const SizedBox(
                                width: 80,
                                height: 80,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: SizedBox(
                                    width: 78,
                                    height: 78,
                                    child: CircleAvatar(
                                      backgroundColor: LightColors.PRIMARY_COLOR,
                                      child: SizedBox(
                                        width: 70,
                                        height: 70,
                                        child:  CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: AssetImage("assets/images/user.png"),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GetBuilder<MyDrawerController>(
                              id: "login&register",
                              builder: (ctrl) {
                                if(!PreferenceUtils.getUserIsLogged()) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          MaterialButton(
                                            color: Colors.white,
                                            
                                            onPressed: (){
                                             
                                            },
                                          ),
                                          const SizedBox(width: 10,),
                                          MaterialButton(
                                             color: Colors.white,
                                            
                                            onPressed: (){
                                             
                                            },
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container(
                                    margin: const EdgeInsets.only(top: 12,),
                                    child: const Text(
                                      '',
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }
                              },
                            )
                          ],
                        )
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               // listItem(Strings.whoUs, ()=> Get.toNamed(Routes.WHO_US)),
                               // listItem(Strings.contactUs, ()=> Get.toNamed(Routes.CONTACT_US)),

                               // listItem("دخول صاحب مؤسسة", (){
                               //   if(OwnerSharedPref.getUserIsLogged()){
                               //     Get.offAllNamed(Routes.OWNER_BASE_DRAWER);
                               //     CustomLoading.showInfoToast(msg: "تم التحويل إلى وضع صاحب المنشئة");
                               //   }else if(OwnerSharedPref.getIntroShow()){
                               //     Get.offAllNamed(Routes.OWNER_LOGIN);
                               //     CustomLoading.showInfoToast(msg: "تم التحويل إلى وضع صاحب المنشئة");
                               //   }else{
                               //     Get.toNamed(Routes.OWNER_SPLASH);
                               //   }
                               // }),
                              listItem(Strings.Profile_personly.tr, () {
                                if(!PreferenceUtils.getUserIsLogged()) {
                                  DialogUtils.showConfirmDialog(
                                      Get.context!,
                                      title: Strings.You_are_not_logged_in.tr,
                                      body: Strings.You_must_be_logged.tr,
                                      isDelete: false,
                                      textButton: Strings.Login.tr,
                                      onConfirm: () {
                                        Get.back();
                                        Get.toNamed(Routes.LOGIN);
                                      });
                                  return;
                                }
                                Get.toNamed(Routes.USER_PROFILE);
                              }),
                              listItem(Strings.my_reservations.tr, () {
                                if(!PreferenceUtils.getUserIsLogged()) {
                                  DialogUtils.showConfirmDialog(
                                      Get.context!,
                                      title: Strings.You_are_not_logged_in.tr,
                                      body: Strings.You_must_be_logged.tr,
                                      isDelete: false,
                                      textButton: Strings.Login.tr,
                                      onConfirm: () {
                                        Get.back();
                                        Get.toNamed(Routes.LOGIN);
                                      });
                                  return;
                                }
                                Get.toNamed(Routes.USER_MY_BOOKING);
                              }),
                               listItem(Strings.Student_List.tr, () {
                                 if(!PreferenceUtils.getUserIsLogged()) {
                                   DialogUtils.showConfirmDialog(
                                       Get.context!,
                                       title: Strings.You_are_not_logged_in.tr,
                                       body: Strings.You_must_be_logged.tr,
                                       isDelete: false,
                                       textButton: Strings.Login.tr,
                                       onConfirm: () {
                                         Get.back();
                                         Get.toNamed(Routes.LOGIN);
                                       });
                                   return;
                                 }
                                 Get.toNamed(Routes.USER_STUDENT);
                               }),
                              listItem(Strings.Favorite.tr, () {
                                if(!PreferenceUtils.getUserIsLogged()) {
                                  DialogUtils.showConfirmDialog(
                                      Get.context!,
                                      title: Strings.You_are_not_logged_in.tr,
                                      body: Strings.You_must_be_logged.tr,
                                      isDelete: false,
                                      textButton: Strings.Login.tr,
                                      onConfirm: () {
                                        Get.back();
                                        Get.toNamed(Routes.LOGIN);
                                      });
                                  return;
                                }
                                Get.toNamed(Routes.USER_FAVORITE);
                              }),
                               listItem(Strings.message.tr, (){
                                 if(!PreferenceUtils.getUserIsLogged()) {
                                   DialogUtils.showConfirmDialog(
                                       Get.context!,
                                       title: Strings.You_are_not_logged_in.tr,
                                       body: Strings.You_must_be_logged.tr,
                                       isDelete: false,
                                       textButton: Strings.Login,
                                       onConfirm: () {
                                         Get.back();
                                         Get.toNamed(Routes.LOGIN);
                                       });
                                   return;
                                 }
                                 Get.toNamed(Routes.SHARED_MESSAGES, arguments: [2]);
                               }),
                               listItem(Strings.my_location.tr, ()=> Get.toNamed(Routes.USER_MY_LOCATION)),

                               // listItem("المفضلة", (){
                               //   if(!SharedPref.getUserIsLogged()) {
                               //     DialogUtils.showConfirmDialog(
                               //         Get.context!,
                               //         title: Strings.You_are_not_logged_in",
                               //         body: Strings.You_must_be_logged,
                               //         isDelete: false,
                               //         textButton: Strings.Login,
                               //         onConfirm: () {
                               //           Get.back();
                               //           Get.toNamed(Routes.LOGIN);
                               //         });
                               //     return;
                               //   }
                               //   Get.toNamed(Routes.OWNER_BASE_DRAWER);
                               // }),

                              listItem(Strings.language.tr + (PreferenceUtils.getCurrentLocale() == const Locale('ar', 'AR') ? " الإنجليزية" : " Arabic"), () {

                                if(PreferenceUtils.getCurrentLocale() == const Locale('ar', 'AR')){
                                  PreferenceUtils.setCurrentLocale(const Locale('en', 'US'));
                                  Get.updateLocale(const Locale('en', 'US'));
                                }else{
                                  PreferenceUtils.setCurrentLocale(const Locale('ar', 'AR'));
                                  Get.updateLocale(const Locale('ar', 'AR'));
                                }
                                Get.find<StartController>().closeDrawer();
                                Get.find<StartController>().onRefresh();

                               }),

                              if(!PreferenceUtils.getUserIsLogged())
                              listItem(Strings.country_and_city.tr, ()=> Get.toNamed(Routes.USER_EDIT_ADDRESS)),
                              GetBuilder<MyDrawerController>(
                                id: "logout",
                                builder: (ctx) {
                                  if(PreferenceUtils.getUserIsLogged()) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 55,),
                                        const Divider(),
                                        Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: ()=> controller.logout(),
                                            borderRadius: BorderRadius.circular(8),
                                            child: Ink(
                                              padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                Strings.logOut.tr,
                                                style: const TextStyle(
                                                    color: Colors.white, fontWeight: FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                },)
                            ]
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Transform.translate(
                offset: PreferenceUtils.getCurrentLocale() == const Locale('en', 'US') ? Offset(size.width * 0.65, 0) : Offset(-size.width * 0.65, 0),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 60),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),

              ///////////////////////////////////
              //////     Language button   //////
              ///////////////////////////////////

              // Positioned(
              //   top: 70,
              //   child: Row(
              //     children: [
              //       IconButton(onPressed: (){
              //         controller.changeLang();
              //         Get.find<HomeController>().openDrawer();
              //       }, icon: Icon(Icons.language_rounded, color: LightColors.ICON_COLOR,)),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/routes/app_pages.dart';
import 'package:reactive_forms/reactive_forms.dart';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  final form = FormGroup({
    'name': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)])
  });

  void signInWithEmailAndPassword() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth
          .signInWithEmailAndPassword(email: email.text, password: pass.text)
          .then((value) async {
        print("LOGIN DONE ");
        Get.toNamed(Routes.HOME);
        // Navigator.pushNamed(context, '/container');
        // Get.offAll(BottomBar());
      });
    } catch (e) {
      print(e.toString());
      print("ERRORR");
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    form.dispose();
  }
}

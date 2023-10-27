import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          foregroundColor: Colors.white,
          primary: true,
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Image.asset('assets/images/netProf.png'),
          )),
      body: Form(
        child: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.email,
                      onSaved: (value) {
                        controller.email.text = value!;
                      },
                      validator: (value) {
                        if (value!.length > 100) {
                          return 'Email Cant Be Larger Than 100 Letter';
                        }
                        if (value.length < 4) {
                          return 'Email Cant Be Smaller Than 4 Letter';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.orange),
                          fillColor: const Color.fromARGB(255, 124, 124, 124),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'Email or phone number',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 233, 233, 233))),
                      cursorColor: const Color.fromARGB(255, 233, 233, 233),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: controller.pass,
                      onSaved: (value) {
                        controller.pass.text = value!;
                      },
                      validator: (value) {
                        if (value!.length > 100) {
                          return 'PassWord Cant Be Larger Than 100 Letter';
                        }
                        if (value.length < 4) {
                          return 'Password Cant Be Smaller Than 4 Letter';
                        }
                        return null;
                      },
                      obscureText: true,
                      cursorColor: const Color.fromARGB(255, 233, 233, 233),
                      decoration: InputDecoration(
                          fillColor: const Color.fromARGB(255, 124, 124, 124),
                          filled: true,
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 233, 233, 233))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: const Size(350, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 233, 233, 233))),
                          backgroundColor: Colors.black),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {
                        controller.signInWithEmailAndPassword();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                        child: Text(
                      'or',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Need help?',
                          style: TextStyle(
                              color: Color.fromARGB(193, 255, 255, 255)),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'New to Netflix? Sign up now.',
                          style: TextStyle(
                              color: Color.fromARGB(223, 255, 255, 255),
                              fontWeight: FontWeight.bold),
                        )),
                    const Text(
                      "Sign-in is protected by Google reCAPTCHA to ensure you're not a bot.",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

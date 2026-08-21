import 'package:flutter/material.dart';
import 'package:furniture_shop/Controllers/register_controller.dart';
import 'package:furniture_shop/UI/first_screen.dart';
import 'package:furniture_shop/UI/home_screen.dart';
import 'package:furniture_shop/UI/log_in_screen.dart';
import 'package:furniture_shop/Utils/utils.dart';
import 'package:get/get.dart';
import '../Widgets/buttons.dart';
import '../Widgets/custom_text_field.dart';

class Register extends GetView<RegisterController> {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Get.off(FirstScreen());
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kBackground,
            actions: [
              TextButton(
                onPressed: () {
                  Get.off(HomeScreen());
                },
                child: Text(
                  "SKIP",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: kBackground,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Create an Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Enter your Details Information",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Email Address";
                        } else if (!value.contains("@")) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      title: "Email Address",
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.registerEmailController,
                    ),
                    CustomTextField(
                      title: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter password";
                        } else if (value.length < 8){
                          return "Password must be at least 8 character";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: controller.registerPasswordController,
                    ),
                    CustomTextField(
                      title: "Mobile Number",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Mobile Number";
                        } else if (value.length != 11){
                          return "Mobile number must be 11 digits";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: controller.registerMobileNumberController,
                    ),
                    CustomTextField(
                      title: "Address",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "enter address";
                        } else if(value.length < 5){
                          return "Address is too short";
                        }
                        return null;
                      },
                      controller: controller.registerAddressController,
                    ),
                    SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.check_box),
                        RichText(
                          text: TextSpan(
                            text: " I have accept ",
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: "Term & Conditions",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold,
                                  decorationThickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Obx(
                      () => Button(
                        text: "Register",
                        isLoading: controller.isLoading.value,
                        onPress: () {
                          controller.onRegisterPress();
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Have an Account?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.off(LogInScreen());
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

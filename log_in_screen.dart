import 'package:flutter/material.dart';
import 'package:furniture_shop/Controllers/log_in_controller.dart';
import 'package:furniture_shop/UI/home_screen.dart';
import 'package:furniture_shop/UI/register_screen.dart';
import 'package:furniture_shop/Utils/utils.dart';
import 'package:get/get.dart';
import '../Widgets/buttons.dart';
import '../Widgets/custom_text_field.dart';
import 'first_screen.dart';

class LogInScreen extends GetView<LogInController> {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LogInController());
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Get.off(FirstScreen());
        }
      },
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kBackground,
            actions: [
              TextButton(
                onPressed: () {
                 Get.offAll(HomeScreen());
                },
                child: Text(
                  "SKIP",
                  style: AppTextStyle.subHeading
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
                      "Let's Sign You In.",
                      style: AppTextStyle.heading,
                    ),
                    Text(
                      "To Continue, first Verify that it's You.",
                      style: AppTextStyle.subHeading,
                    ),

                    CustomTextField(
                      title: "Email Address",
                      validator: (value){
                        if (value == null || value.isEmpty){
                          return "Please enter email";
                        }else if(!value.isEmail){
                          return "Enter A valid Email";
                        }
                        return null;
                      },
                      controller:controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    CustomTextField(
                      title: "Password",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter password";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller:controller.passwordController,
                    ),

                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 250),
                      child: Text(
                        "Forget Password",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 50),
                    Obx(
                        ()=>  Button(text: "Login",
                            isLoading: controller.isLoading.value,
                            onPress: controller.onLoginPress),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 230),
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
                             Get.to(Register());
                            },
                            child: Text(
                              "REGISTER",
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
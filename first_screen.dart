import 'package:flutter/material.dart';
import 'package:furniture_shop/UI/log_in_screen.dart';
import 'package:furniture_shop/UI/register_screen.dart';
import 'package:furniture_shop/Utils/utils.dart';
import 'package:get/get.dart';
import '../Widgets/buttons.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: Image.asset(kFirstScreenImage, fit: BoxFit.cover)),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Button(
                    text: "Register",
                    onPress: () {
                     Get.off(Register());
                    },
                  ),
                  SizedBox(height: 20),
                  Button(
                    text: "Login",
                    onPress: () {
                      Get.off(LogInScreen());
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

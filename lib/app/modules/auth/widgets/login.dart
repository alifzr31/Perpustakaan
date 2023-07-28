import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/components/base_button.dart';
import 'package:perpustakaan/app/components/auth_textform.dart';
import 'package:perpustakaan/app/core/values/colors.dart';
import 'package:perpustakaan/app/modules/auth/controller.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.formKeyLogin.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    AuthTextForm(
                      label: 'Email',
                      controller: controller.emailController.value,
                      icon: const Icon(Icons.mail),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan email anda';
                        } else {
                          if (!value.isEmail) {
                            return 'Email tidak valid';
                          }
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    AuthTextForm(
                      label: 'Password',
                      controller: controller.passwordController.value,
                      obscure: controller.showPassLogin.value,
                      keyboardType: TextInputType.visiblePassword,
                      icon: IconButton(
                        onPressed: () {
                          controller.showPassLogin.value =
                              !controller.showPassLogin.value;
                        },
                        icon: Icon(controller.showPassLogin.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan password anda';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: orangeColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: BaseButton(
                bgColor: orangeColor,
                fgColor: greenColor,
                text: 'Log In',
                onPressed: () {
                  if (controller.formKeyLogin.value.currentState!.validate()) {
                    controller.login(context);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

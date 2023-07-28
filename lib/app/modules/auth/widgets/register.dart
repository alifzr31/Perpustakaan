import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perpustakaan/app/components/auth_textform.dart';
import 'package:perpustakaan/app/components/base_button.dart';
import 'package:perpustakaan/app/core/values/colors.dart';
import 'package:perpustakaan/app/modules/auth/controller.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: controller.formKeyRegister.value,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    AuthTextForm(
                      label: 'Nama Lengkap',
                      controller: controller.nameRegistController.value,
                      icon: const Icon(Icons.person),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan nama lengkap anda';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    AuthTextForm(
                      label: 'Email',
                      controller: controller.emailRegistController.value,
                      icon: const Icon(Icons.mail),
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
                      controller: controller.passwordRegistController.value,
                      obscure: controller.showPass.value,
                      icon: IconButton(
                        onPressed: () {
                          controller.showPass.value =
                              !controller.showPass.value;
                        },
                        icon: Icon(controller.showPass.value
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
                    const SizedBox(height: 20),
                    AuthTextForm(
                      label: 'Konfirmasi Password',
                      controller: controller.passwordConfirmController.value,
                      obscure: controller.showPassConfirm.value,
                      icon: IconButton(
                        onPressed: () {
                          controller.showPassConfirm.value =
                              !controller.showPassConfirm.value;
                        },
                        icon: Icon(controller.showPassConfirm.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukkan konfirmasi password anda';
                        } else {
                          if (value !=
                              controller.passwordRegistController.value.text) {
                            return 'Password tidak sama';
                          }
                        }

                        return null;
                      },
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
                text: 'Register',
                onPressed: () {
                  if (controller.formKeyRegister.value.currentState!.validate()) {
                    controller.register(context);
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naji_shop/logic/controllers/auth_controller.dart';
import 'package:naji_shop/routes/routes.dart';
import 'package:naji_shop/utils/my_string.dart';
import 'package:naji_shop/utils/theme.dart';
import 'package:naji_shop/view/widgets/auth/auth_button.dart';
import 'package:naji_shop/view/widgets/auth/auth_text_form_field.dart';
import 'package:naji_shop/view/widgets/auth/container_under.dart';
import 'package:naji_shop/view/widgets/text_utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.theme.backgroundColor,
          elevation: 0,
        ),
        backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 40,
                  ),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: "LOG",
                              fontsize: 28,
                              fontWeight: FontWeight.w500,
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            TextUtils(
                              text: "IN",
                              fontsize: 28,
                              fontWeight: FontWeight.w500,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        const SizedBox(
                          height: 20,
                        ),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return 'Invalid email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  Icons.email,
                                  color: pinkClr,
                                  size: 30,
                                )
                              : Image.asset('assets/images/email.png'),
                          suffixIcon: const Text(''),
                          hintText: 'Email',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(
                          initState: (_) {},
                          builder: (_) {
                            return AuthTextFormField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibility ? false : true,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? const Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    )
                                  : Image.asset('assets/images/lock.png'),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    controller.visibility();
                                  },
                                  icon: controller.isVisibility
                                      ? const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black,
                                        )
                                      : const Icon(
                                          Icons.visibility,
                                          color: Colors.black,
                                        )),
                              hintText: 'Password',
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgotPasswordScreen);
                            },
                            child: TextUtils(
                              text: "Forgot Password",
                              fontsize: 14,
                              fontWeight: FontWeight.normal,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              underLine: TextDecoration.none,
                            ),
                          ),
                        ),

                        /*const SizedBox(
                          height: 50,
                        ),*/
                        //CheckWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(
                          initState: (_) {},
                          builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (fromKey.currentState!.validate()) {
                                  String password =
                                      passwordController.text.trim();
                                  String email = emailController.text.trim();
                                  controller.logInUsingFirebase(
                                    email: email,
                                    password: password,
                                  );
                                }
                              },
                              text: "LOG IN",
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                          text: "OR",
                          fontsize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<AuthController>(
                              initState: (_) {},
                              builder: (_) {
                                return InkWell(
                                    onTap: () {
                                      controller.facebookSingUpApp();
                                    },
                                    child: Image.asset(
                                        "assets/images/facebook.png"));
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GetBuilder<AuthController>(
                              initState: (_) {},
                              builder: (_) {
                                return InkWell(
                                    onTap: () {
                                      controller.googleSingUpApp();
                                    },
                                    child: Image.asset(
                                        "assets/images/google.png"));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                  text: "Don't have an Account? ",
                  onPressed: () {
                    Get.offNamed(Routes.singUpScreen);
                  },
                  textType: "Sing up"),
            ],
          ),
        ),
      ),
    );
  }
}

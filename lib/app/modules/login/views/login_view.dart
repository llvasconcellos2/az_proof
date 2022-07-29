import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils.dart';
import '../../../az_theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: SvgPicture.asset(
                    'assets/images/reduzido.svg',
                    clipBehavior: Clip.antiAlias,
                  ),
                ),
                const SizedBox(height: 42),
                SizedBox(
                  width: 358,
                  child: Form(
                    key: controller.formKey,
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'E-mail',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AzColors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                style: const TextStyle(fontSize: 14),
                                controller: controller.emailController,
                                focusNode: controller.emailFocus,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                cursorColor: AzColors.red,
                                validator: (value) =>
                                    controller.validateEmail(value ?? ''),
                                onChanged: (value) =>
                                    controller.checkEmailError = false,
                                onTap: () {
                                  controller.setFocusOnEmail();
                                  setState(() {});
                                },
                                enabled: !controller.loading,
                                decoration: InputDecoration(
                                  hintText: 'seuemail@exemplo.com',
                                  hintStyle: const TextStyle(fontSize: 14),
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  hoverColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: AzColors.whiteGray,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: AzColors.red,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: AzColors.deepRed,
                                    ),
                                  ),
                                  suffixIcon: Icon(
                                    controller.checkEmailError
                                        ? PhosphorIcons.x_circle_fill
                                        : null,
                                    color: !controller.checkEmailError
                                        ? null
                                        : AzColors.deepRed,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 19),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Text(
                                'Senha',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AzColors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                style: const TextStyle(fontSize: 14),
                                controller: controller.passwordController,
                                focusNode: controller.passwordFocus,
                                obscureText: controller.showPassword,
                                textInputAction: TextInputAction.done,
                                validator: (value) =>
                                    controller.validatePassword(value ?? ''),
                                onChanged: (_) =>
                                    controller.checkPasswordError = false,
                                onTap: () {
                                  controller.setFocusOnPassword();
                                  setState(() {});
                                },
                                keyboardType: TextInputType.visiblePassword,
                                cursorColor: AzColors.red,
                                enabled: !controller.loading,
                                decoration: InputDecoration(
                                  hintText: '•••••••••',
                                  hintStyle: const TextStyle(fontSize: 14),
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  hoverColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: AzColors.whiteGray,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: AzColors.red,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    borderSide: const BorderSide(
                                      color: AzColors.deepRed,
                                    ),
                                  ),
                                  suffixIcon: !controller.checkPasswordError
                                      ? InkWell(
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.white,
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          onTap: () {
                                            controller.showPassword =
                                                !controller.showPassword;

                                            controller.setFocusOnPassword();

                                            setState(() {});
                                          },
                                          child: Icon(
                                            controller.showPassword
                                                ? PhosphorIcons.eye_slash
                                                : PhosphorIcons.eye,
                                            color: !controller
                                                    .passwordFocus.hasFocus
                                                ? Colors.grey.shade600
                                                : AzColors.red,
                                            size: 20,
                                          ),
                                        )
                                      : const Icon(
                                          PhosphorIcons.x_circle_fill,
                                          color: AzColors.deepRed,
                                          size: 20,
                                        ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 56),
                            child: Obx(
                              () => ElevatedButton(
                                onPressed: () async {
                                  if (controller.formKey.currentState != null &&
                                      controller.formKey.currentState!
                                          .validate()) {
                                    controller.loading = true;

                                    bool response =
                                        await controller.signInController(
                                      controller.emailController.text,
                                      controller.passwordController.text,
                                    );

                                    if (response) {
                                      Get.offAndToNamed(Routes.kHome);
                                    } else {
                                      Utils.showSnackbar(controller.error);
                                    }
                                    controller.loading = false;
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    AzColors.red,
                                  ),
                                  fixedSize: MaterialStateProperty.all<Size>(
                                    const Size.fromHeight(48),
                                  ),
                                ),
                                child: controller.loading
                                    ? const SizedBox(
                                        height: 18,
                                        width: 18,
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                            Colors.white,
                                          ),
                                        ),
                                      )
                                    : const Text(
                                        'Entrar',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24, bottom: 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '® Desenvolvido por Azape',
                  style: TextStyle(
                    fontSize: 12,
                    color: AzColors.violet,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

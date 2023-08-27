import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../lang/translation_keys.dart';
import '../../../../shared/lang/lang_service.dart';
import '../../../../shared/themes/sizes.dart';
import '../../../../shared/utils/validators.dart';
import '../../../../shared/widgets/buttons/buttons.dart';
import '../../../../shared/widgets/fields/fields.dart';
import '../../../../shared/widgets/text/text.dart';
import '../../assets/auth_assets.dart';
import '../../widgets/text_with_link.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: Image.asset(AuthAssets.loginImage)),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.defaultPadding),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TitleText(
                      LanguageService.translate(AuthTranslationKeys.login))),
            ),
            const SizedBox(height: Sizes.defaultSpacer),
            Padding(
              padding: const EdgeInsets.only(left: Sizes.defaultPadding),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(LanguageService.translate(
                      AuthTranslationKeys.pleaseSignInToContinue))),
            ),
            const SizedBox(height: Sizes.defaultSpacer),
            _LoginForm(
                onPasswordChanged: (value) => controller.password.value = value,
                onEmailChanged: (value) => controller.email.value = value,
                forgotPassword: controller.forgotPassword,
                signIn: controller.signIn),
            TextWithLink(
              text: LanguageService.translate(
                  AuthTranslationKeys.dontHaveAccount),
              link: LanguageService.translate(AuthTranslationKeys.signUp),
              onLink: controller.signUp,
            ),
            const SizedBox(height: Sizes.defaultSpacer),
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  final void Function(String value) onPasswordChanged;
  final void Function(String value) onEmailChanged;
  final void Function() forgotPassword;
  final void Function() signIn;

  const _LoginForm({
    super.key,
    required this.onPasswordChanged,
    required this.onEmailChanged,
    required this.forgotPassword,
    required this.signIn,
  });

  @override
  State<_LoginForm> createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    emailFocus.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Sizes.defaultPadding),
      child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BasicTextFormField(
                controller: emailTextController,
                focusNode: emailFocus,
                onChanged: widget.onEmailChanged,
                onFieldSubmitted: (p0) {
                  passwordFocus.requestFocus();
                },
                validator: Validators.validateEmail,
                hint:
                    LanguageService.translate(AuthTranslationKeys.emailAddress),
                keyboard: TextInputType.emailAddress,
              ),
              const SizedBox(height: Sizes.defaultSpacer),
              BasicTextFormField(
                controller: passwordTextController,
                focusNode: passwordFocus,
                changePasswordVisibility: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
                validator: Validators.validatePassword,
                isObscured: _isObscured,
                onChanged: widget.onPasswordChanged,
                hint: LanguageService.translate(AuthTranslationKeys.password),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: PrimaryTextButton(
                  onPressed: widget.forgotPassword,
                  child: Text(
                    LanguageService.translate(
                        AuthTranslationKeys.forgotPassword),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
              const SizedBox(height: 5 * Sizes.defaultSpacer),
              PrimaryButton(
                expanded: true,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    widget.signIn();
                  }
                },
                child:
                    Text(LanguageService.translate(AuthTranslationKeys.signIn)),
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    emailFocus.dispose();
    passwordFocus.dispose();
    passwordTextController.dispose();
    emailTextController.dispose();
    super.dispose();
  }
}

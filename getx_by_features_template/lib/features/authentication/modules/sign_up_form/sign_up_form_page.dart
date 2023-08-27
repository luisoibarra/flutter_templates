import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/lang/lang_service.dart';
import '../../../../shared/themes/sizes.dart';
import '../../../../shared/utils/validators.dart';
import '../../../../shared/widgets/buttons/buttons.dart';
import '../../../../shared/widgets/fields/fields.dart';
import '../../lang/translation_keys.dart';
import '../../widgets/text_with_link.dart';
import 'sign_up_form_controller.dart';

class SignUpFormPage extends StatefulWidget {
  const SignUpFormPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  final _personalFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpFormController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text(
                LanguageService.translate(AuthTranslationKeys.createAccount)),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ExtendedBannerHeader(
                          header: LanguageService.translate(
                              AuthTranslationKeys.personalDetailsCaps)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Sizes.defaultPadding,
                        ),
                        child: _PersonalInformationForm(
                          formKey: _personalFormKey,
                          controller: controller,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: Sizes.defaultSpacer),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.defaultPadding),
                child: PrimaryButton(
                  expanded: true,
                  onPressed: () {
                    final personalValid =
                        _personalFormKey.currentState!.validate();
                    if (personalValid) {
                      controller.signUp();
                    }
                  },
                  child: Text(
                      LanguageService.translate(AuthTranslationKeys.signUp)),
                ),
              ),
              const SizedBox(height: Sizes.defaultSpacer),
              TextWithLink(
                text: LanguageService.translate(
                    AuthTranslationKeys.alreadyHaveAnAccount),
                link: LanguageService.translate(AuthTranslationKeys.signIn),
                onLink: controller.signIn,
              ),
              const SizedBox(height: Sizes.defaultSpacer),
            ],
          )),
    );
  }
}

class ExtendedBannerHeader extends StatelessWidget {
  const ExtendedBannerHeader({super.key, required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: Theme.of(context).colorScheme.secondary.withAlpha(50),
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.defaultPadding,
              vertical: Sizes.defaultPadding / 2),
          child: Text(
            header,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: Sizes.mediumText),
          ),
        ))
      ],
    );
  }
}

class _PersonalInformationForm extends StatefulWidget {
  final SignUpFormController controller;
  final GlobalKey<FormState> formKey;
  const _PersonalInformationForm(
      {super.key, required this.controller, required this.formKey});

  @override
  State<_PersonalInformationForm> createState() =>
      _PersonalInformationFormState();
}

class _PersonalInformationFormState extends State<_PersonalInformationForm> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _mobileController = TextEditingController();
  bool _passwordObscured = false;
  bool _confirmPasswordObscured = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const SizedBox(height: Sizes.defaultSpacer),
          BasicTextFormField(
            controller: _firstNameController,
            hint: LanguageService.translate(AuthTranslationKeys.firstName),
            validator: Validators.validateRequiredField,
            onChanged: (value) {
              widget.controller.firstName.value = value;
            },
          ),
          const SizedBox(height: Sizes.defaultSpacer),
          BasicTextFormField(
            controller: _lastNameController,
            hint: LanguageService.translate(AuthTranslationKeys.lastName),
            validator: Validators.validateRequiredField,
            onChanged: (value) {
              widget.controller.lastName.value = value;
            },
          ),
          const SizedBox(height: Sizes.defaultSpacer),
          Obx(() {
            return DateTimeFormField(
              initialDate: widget.controller.dateOfBirth.value ??
                  DateTime(DateTime.now().year - 25),
              firstDate: DateTime(DateTime.now().year - 70),
              lastDate: DateTime(DateTime.now().year - 18),
              hint: LanguageService.translate(AuthTranslationKeys.dateOfBirth),
              onChanged: (date) {
                widget.controller.dateOfBirth.value = date;
              },
              validator: (value) =>
                  Validators.validateRequiredField(value?.toString()),
            );
          }),
          const SizedBox(height: Sizes.defaultSpacer),
          BasicTextFormField(
            controller: _emailController,
            hint: LanguageService.translate(AuthTranslationKeys.emailAddress),
            validator: Validators.validateEmail,
            onChanged: (value) {
              widget.controller.email.value = value;
            },
            keyboard: TextInputType.emailAddress,
          ),
          const SizedBox(height: Sizes.defaultSpacer),
          BasicTextFormField(
            controller: _passwordController,
            hint: LanguageService.translate(AuthTranslationKeys.password),
            isObscured: _passwordObscured,
            changePasswordVisibility: () {
              setState(() {
                _passwordObscured = !_passwordObscured;
              });
            },
            validator: Validators.validatePassword,
            onChanged: (value) {
              widget.controller.password.value = value;
            },
          ),
          const SizedBox(height: Sizes.defaultSpacer),
          BasicTextFormField(
            controller: _confirmPasswordController,
            hint:
                LanguageService.translate(AuthTranslationKeys.confirmPassword),
            isObscured: _confirmPasswordObscured,
            changePasswordVisibility: () {
              setState(() {
                _confirmPasswordObscured = !_confirmPasswordObscured;
              });
            },
            validator: (value) {
              if (value != _passwordController.text) {
                return LanguageService.translate(
                    AuthTranslationKeys.passwordDidntMatch);
              }
              return null;
            },
            onChanged: (value) {
              widget.controller.confirmPassword.value = value;
            },
          ),
          const SizedBox(height: Sizes.defaultSpacer),
          BasicTextFormField(
            controller: _mobileController,
            hint: LanguageService.translate(AuthTranslationKeys.mobile),
            validator: Validators.validateMobileNumber,
            onChanged: (value) {
              widget.controller.mobile.value = value;
            },
            keyboard: TextInputType.phone,
          ),
          const SizedBox(height: Sizes.defaultSpacer),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }
}

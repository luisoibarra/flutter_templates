// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../themes/sizes.dart';
import '../../utils/formatters.dart';

typedef ValidatorCall = String? Function(String? value);

class FieldTextSuffix extends StatelessWidget {
  const FieldTextSuffix({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.mediumText),
            ),
          )
        ],
      ),
    );
  }
}

class BasicTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hint;
  final bool enabled;
  final ValidatorCall? validator;
  final VoidCallback? changePasswordVisibility;
  final void Function(String value)? onChanged;
  final bool isObscured;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final TextInputType? keyboard;

  const BasicTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.enabled = true,
    this.validator,
    this.changePasswordVisibility,
    this.isObscured = false,
    this.onChanged,
    this.hint,
    this.onFieldSubmitted,
    this.suffix,
    this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      enabled: enabled,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.defaultBorderRadius),
        ),
        suffixIcon: suffix ??
            (changePasswordVisibility != null
                ? IconButton(
                    onPressed: changePasswordVisibility,
                    icon: Icon(
                      isObscured ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).colorScheme.onBackground,
                    ))
                : null),
      ),
      obscureText: isObscured,
      keyboardType: keyboard ??
          (changePasswordVisibility != null
              ? TextInputType.visiblePassword
              : null),
    );
  }
}

class DateTimeFormField extends StatefulWidget {
  const DateTimeFormField({
    Key? key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onChanged,
    this.hint,
    this.validator,
  }) : super(key: key);

  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? hint;
  final void Function(DateTime date)? onChanged;
  final String? Function(DateTime? date)? validator;

  @override
  State<DateTimeFormField> createState() => _DateTimeFormFieldState();
}

class _DateTimeFormFieldState extends State<DateTimeFormField> {
  final dateInputController = TextEditingController();

  void showDatePickerAndSetDate() async {
    final initialDate = widget.initialDate ?? DateTime.now();
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: widget.firstDate ??
            // Subtract 100 years
            initialDate.subtract(const Duration(days: 365 * 100)),
        lastDate: widget.lastDate ??
            // Add 100 years
            initialDate.add(const Duration(days: 365 * 100)));
    if (pickedDate != null) {
      setState(() {
        dateInputController.text = Formatters.formatDate(pickedDate);
      });
      widget.onChanged?.call(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateInputController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.defaultBorderRadius),
        ),
        suffixIcon: IconButton(
          onPressed: showDatePickerAndSetDate,
          icon: Icon(
            Icons.calendar_month,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
        hintText: widget.hint,
      ),
      readOnly: true, //set it true, so that user will not able to edit text
      onTap: showDatePickerAndSetDate,
      validator: (value) {
        if (value == null) {
          return widget.validator?.call(null);
        } else {
          final date = Formatters.tryParseDate(value);
          return widget.validator?.call(date);
        }
      },
    );
  }

  @override
  void dispose() {
    dateInputController.dispose();
    super.dispose();
  }
}

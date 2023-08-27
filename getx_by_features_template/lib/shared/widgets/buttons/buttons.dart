import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool expanded;
  final Widget? icon;
  final ButtonStyle? style;

  const PrimaryButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.expanded = false,
    this.icon,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ElevatedButton button;
    ButtonStyle baseStyle = ElevatedButton.styleFrom();
    if (style != null) {
      baseStyle = style!;
    }
    baseStyle = baseStyle.merge(ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    ));
    if (icon != null) {
      button = ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon!,
        style: baseStyle,
        label: child,
      );
    } else {
      button = ElevatedButton(
        onPressed: onPressed,
        style: baseStyle,
        child: child,
      );
    }
    return expanded ? Row(children: [Expanded(child: button)]) : button;
  }
}

class SecondaryButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const SecondaryButton({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: child);
  }
}

class PrimaryTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const PrimaryTextButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: child);
  }
}

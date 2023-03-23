import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/colors.dart';
import '../values/dimens.dart';

abstract class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final ButtonStyle? style;
  final ButtonSize size;

  const Button(Key? key, this.text, this.onPressed, this.icon, this.style, this.size)
      : super(key: key);

  TextStyle? get _textStyle {
    switch (size) {
      case ButtonSize.normal:
        return Get.textTheme.titleMedium;

      case ButtonSize.small:
        return Get.textTheme.labelLarge;
    }
  }

  double get _height {
    switch (size) {
      case ButtonSize.normal:
        return 40;

      case ButtonSize.small:
        return 30;
    }
  }
}

class CustomFilledButton extends Button {
  const CustomFilledButton({
    Key? key,
    required String text,
    required VoidCallback? onPressed,
    Widget? icon,
    ButtonStyle? style,
    ButtonSize size = ButtonSize.normal,
  }) : super(key, text, onPressed, icon, style, size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: icon == null
          ? ElevatedButton(
              onPressed: onPressed,
              style: style,
              child: Text(text, style: _textStyle),
            )
          : ElevatedButton.icon(
              onPressed: onPressed,
              icon: icon!,
              label: Text(text, style: _textStyle),
              style: style,
            ),
    );
  }
}

class LoadingViewButton extends CustomFilledButton {
  final bool isLoading;

  const LoadingViewButton({
    Key? key,
    required String text,
    required this.isLoading,
    required VoidCallback? onPressed,
    Widget? icon,
    ButtonStyle? style,
  }) : super(key: key, text: text, onPressed: onPressed, icon: icon, style: style);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            height: _height,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadii.button,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
                ),
                Spacing.h10,
                Text('Please wait...', style: _textStyle),
              ],
            ),
          )
        : CustomFilledButton(
            text: text,
            onPressed: onPressed,
            icon: icon,
          );
  }
}

///[Button] size
enum ButtonSize { normal, small }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intatrack/core/values/styles.dart';

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
  final Color? color;

  const LoadingViewButton({
    Key? key,
    this.color,
    required String text,
    required this.isLoading,
    required VoidCallback? onPressed,
    Widget? icon,
    ButtonStyle? style,
    ButtonSize size = ButtonSize.normal,
  }) : super(key: key, text: text, onPressed: onPressed, icon: icon, style: style, size: size);

  @override
  Widget build(BuildContext context) {
    final progressbarSize = _progressbarHeight;
    return isLoading
        ? Container(
            height: _height,
            decoration: BoxDecoration(
              color: color ?? AppColors.primary,
              borderRadius: BorderRadii.button,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: progressbarSize,
                  width: progressbarSize,
                  child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 3),
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
            size: size,
            style: ButtonStyles.elevatedButtonStyle.copyWith(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (state) => color ?? AppColors.primary,
              ),
            ),
          );
  }

  double get _progressbarHeight {
    switch (size) {
      case ButtonSize.normal:
        return 20;

      case ButtonSize.small:
        return 15;
    }
  }
}

///[Button] size
enum ButtonSize { normal, small }

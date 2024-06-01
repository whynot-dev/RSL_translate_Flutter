import 'package:flutter/material.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({
    required this.text,
    this.textStyle = const TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.onBackground),
    this.textStyleDisabled = const TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.gray3),
    this.onPressed,
    this.enabled = true,
  });

  final String text;
  final TextStyle textStyle;
  final TextStyle textStyleDisabled;
  final VoidCallback? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (enabled) {
            onPressed?.call();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Text(
            text,
            style: enabled ? textStyle : textStyleDisabled,
          ),
        ),
      );
}

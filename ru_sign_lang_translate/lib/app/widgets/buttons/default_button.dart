import 'package:flutter/material.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    this.text,
    this.onPressed,
    this.enabled = true,
    this.color = AppColors.accent,
    this.disabledColor = AppColors.gray1,
    this.textColor = AppColors.onAccent,
    this.textSize = 17,
    this.disabledTextColor = AppColors.gray3,
    this.borderColor,
    this.prefixImage,
    this.height = 56,
    this.padding,
    this.borderRadius = 20,
  });

  final String? text;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color color;
  final Color disabledColor;
  final Color textColor;
  final double textSize;
  final Color disabledTextColor;
  final Color? borderColor;
  final Widget? prefixImage;
  final double height;
  final EdgeInsets? padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          if (enabled) {
            onPressed?.call();
          }
        },
        child: SizedBox(
          height: height,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: borderColor != null ? Border.all(color: borderColor!) : null,
              color: enabled ? color : disabledColor,
            ),
            padding: padding ?? const EdgeInsets.all(16),
            width: double.maxFinite,
            child: text != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (prefixImage != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 9),
                          child: prefixImage,
                        ),
                      Text(
                        text!,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: textSize,
                          color: enabled ? textColor : disabledTextColor,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
        ),
      );
}

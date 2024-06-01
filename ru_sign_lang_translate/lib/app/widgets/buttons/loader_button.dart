import 'package:flutter/material.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/widgets/loaders/circular_progress.dart';

class LoaderButton extends StatelessWidget {
  LoaderButton({
    this.text,
    this.onPressed,
    this.enabled = true,
    this.color = AppColors.accent,
    this.disabledColor = AppColors.gray1,
    this.textColor = AppColors.onAccent,
    this.disabledTextColor = AppColors.gray3,
    this.borderColor,
    this.prefixImage,
    this.height = 56,
    this.padding,
    this.isLoading = false,
  });

  final String? text;
  final VoidCallback? onPressed;
  final bool enabled;
  final Color color;
  final Color disabledColor;
  final Color textColor;
  final Color disabledTextColor;
  final Color? borderColor;
  final Widget? prefixImage;
  final double height;
  final EdgeInsets? padding;
  final bool isLoading;

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
              borderRadius: BorderRadius.circular(20),
              border: borderColor != null ? Border.all(color: borderColor!) : null,
              color: isLoading ? color : enabled ? color : disabledColor,
            ),
            padding: padding ?? const EdgeInsets.all(16),
            width: double.maxFinite,
            child: _buildBody(),
          ),
        ),
      );

  Widget _buildBody() => isLoading
      ? CircularProgress()
      : text != null
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
                    fontSize: 17,
                    color: enabled ? textColor : disabledTextColor,
                  ),
                ),
              ],
            )
          : const SizedBox();
}

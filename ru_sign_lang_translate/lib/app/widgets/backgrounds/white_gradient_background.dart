import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/resources/app_styles.dart';

class WhiteGradientBackground extends StatelessWidget {
  WhiteGradientBackground({
    required this.child,
    this.padding,
    this.systemUiStyle,
  });

  final Widget child;
  final EdgeInsets? padding;
  final SystemUiOverlayStyle? systemUiStyle;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: double.infinity,
        padding: padding ?? EdgeInsets.zero,
        decoration: const BoxDecoration(
          color: AppColors.white,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.grayBackground,
              AppColors.white,
            ],
          ),
        ),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiStyle ?? AppStyles.lightStyle,
          child: child,
        ),
      );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/resources/app_styles.dart';

class DefaultBlackBackground extends StatelessWidget {
  DefaultBlackBackground({
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
          color: AppColors.darkBlue,
          gradient: const RadialGradient(
            stops: [0.001, 1],
            radius: 0.6,
            colors: [AppColors.startGradientBackground, AppColors.endGradientBackground],
          ),
        ),
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiStyle ?? AppStyles.darkStyle,
          child: child,
        ),
      );
}

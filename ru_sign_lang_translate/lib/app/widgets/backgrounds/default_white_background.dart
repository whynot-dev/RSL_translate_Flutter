import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/app/resources/app_styles.dart';

class DefaultWhiteBackground extends StatelessWidget {
  DefaultWhiteBackground({
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
        color: AppColors.white,
        padding: padding ?? EdgeInsets.zero,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUiStyle ?? AppStyles.lightStyle,
          child: child,
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/gen/assets.gen.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  DefaultAppbar({
    this.title,
    this.subtitle,
    this.needDivider = false,
    this.onBackPressed,
    this.backButtonColor = AppColors.onAccent,
    this.backgroundColor = AppColors.grayBackground,
    this.sizeFromHeight = 58,
    this.rightWidget = const SizedBox(),
    this.onRightWidgetPressed,
  });

  final String? title;
  final String? subtitle;
  final bool needDivider;
  final VoidCallback? onBackPressed;
  final Color backButtonColor;
  final Color backgroundColor;
  final double sizeFromHeight;
  final Widget rightWidget;
  final VoidCallback? onRightWidgetPressed;

  @override
  Size get preferredSize => Size.fromHeight(sizeFromHeight);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        height: sizeFromHeight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: _buildBackButton(),
                  ),
                  Center(
                    child: _buildTitles(),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: rightWidget,
                  ),
                ],
              ),
            ),
            if (needDivider) _buildDivider(),
          ],
        ),
      );

  Widget _buildDivider() => Container(
        width: double.maxFinite,
        height: 1,
        color: AppColors.gray7,
      );

  Widget _buildBackButton() => GestureDetector(
        onTap: () {
          onBackPressed?.call();
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset(
            Assets.images.backArrow,
            height: 32,
            width: 32,
            color: backButtonColor,
          ),
        ),
      );

  Widget _buildTitles() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null) _buildTitle(),
            if (title != null && subtitle != null) const SizedBox(height: 2),
            if (subtitle != null) _buildSubtitle(),
          ],
        ),
      );

  Widget _buildTitle() => Text(
        title!,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: AppColors.onBackground,
        ),
      );

  Widget _buildSubtitle() => Text(
        subtitle!,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          height: 18 / 13,
          color: AppColors.onBackground,
        ),
      );
}

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    this.text,
    this.onPressed,
  });

  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        overlayColor: MaterialStateProperty.all(AppColors.black6),
        child: SizedBox(
          height: 52,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black5.withOpacity(0.3),
                  offset: const Offset(0, 10),
                  blurRadius: 15,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 32,
                  sigmaY: 32,
                ),
                child: Container(
                  color: AppColors.black5.withOpacity(0.5),
                  alignment: Alignment.center,
                  child: Text(
                    text ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

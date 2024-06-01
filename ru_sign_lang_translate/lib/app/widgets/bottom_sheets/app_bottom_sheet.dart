import 'package:flutter/material.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';

class AppBottomSheet {
  static Future<T?> show<T>(
    BuildContext context,
    Widget child, {
    bool rootNavigator = false,
    RouteSettings? routeSettings,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: rootNavigator,
      backgroundColor: AppColors.background,
      routeSettings: routeSettings,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (BuildContext context) => Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewInsets.top, bottom: MediaQuery.of(context).viewInsets.bottom),
        child: child,
      ),
    );
  }
}

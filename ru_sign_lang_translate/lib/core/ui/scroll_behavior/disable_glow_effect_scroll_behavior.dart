import 'package:flutter/material.dart';

class DisableGrowEffectScrollBehavior extends ScrollBehavior {
  const DisableGrowEffectScrollBehavior();
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

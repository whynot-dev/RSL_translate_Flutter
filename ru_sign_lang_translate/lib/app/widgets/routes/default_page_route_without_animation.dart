import 'package:flutter/material.dart';

class PageRouteWithoutAnimation<T> extends MaterialPageRoute<T> {
  PageRouteWithoutAnimation({
    required WidgetBuilder builder,
    RouteSettings? settings,
  }) : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => Duration.zero;
}

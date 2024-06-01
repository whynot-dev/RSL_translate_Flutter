/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsI18nGen {
  const $AssetsI18nGen();

  String get ru => 'assets/i18n/ru.json';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get appIcon =>
      const AssetGenImage('assets/images/app_icon.png');
  String get backArrow => 'assets/images/back_arrow.svg';
  String get filter => 'assets/images/filter.svg';
  AssetGenImage get location =>
      const AssetGenImage('assets/images/location.png');
  String get map => 'assets/images/map.svg';
  AssetGenImage get marker => const AssetGenImage('assets/images/marker.png');
  AssetGenImage get marker2 => const AssetGenImage('assets/images/marker2.png');
  AssetGenImage get markerFinish =>
      const AssetGenImage('assets/images/marker_finish.png');
  AssetGenImage get markerStart =>
      const AssetGenImage('assets/images/marker_start.png');
  String get minus => 'assets/images/minus.svg';
  String get myMarker => 'assets/images/my_marker.svg';
  String get myMarker2 => 'assets/images/my_marker_2.svg';
  String get navigationProfile => 'assets/images/navigation_profile.svg';
  String get navigationRoutes => 'assets/images/navigation_routes.svg';
  String get plus => 'assets/images/plus.svg';
  String get send => 'assets/images/send.svg';
}

class Assets {
  Assets._();

  static const $AssetsI18nGen i18n = $AssetsI18nGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

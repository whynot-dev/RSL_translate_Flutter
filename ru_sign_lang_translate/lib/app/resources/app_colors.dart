import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFFDFF14C);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color onAccent = Color(0xFF11171C);
  static const Color onPrimary = Color(0xFF11171C);
  static const Color onSurface = Color(0xFF11171C);
  static const Color onBackground = Color(0xFF11171C);

  static const Color background = Color(0xFFFFFFFF);
  static const Color grayBackground = Color(0xFFF9FAFC);

  static const Color inputBackground = Color(0xFFC2C5CC);
  static const Color inputBorder = Color(0xFFC2C5CC);
  static const Color focusedInputBorder = Color(0xFFDFF14C);
  static const Color inputHint = Color(0xFFA9ACB2);
  static const Color inputLabel = Color(0xFFA9ACB2);
  static const Color inputText = Color(0xFF11171C);

  static const Color error = Color(0xFFFF2F2F);
  static const Color errorMessage = Color(0xFFDE3737);

  static const Color white = Color(0xFFFFFFFF);
  static const Color white10 = Color(0x1AFFFFFF);
  static const Color white15 = Color(0x26FFFFFF);
  static const Color white40 = Color(0x66FFFFFF);
  static const Color white2 = Color(0x40FFFFFF);
  static const Color white3 = Color(0x08FFFFFF);
  static const Color white4 = Color(0xFFF9FAFD);

  static const Color gray0 = Color(0x00C2C5CC);
  static const Color gray1 = Color(0xFFEEEFF2);
  static const Color gray2 = Color(0xFFD5D7DB);
  static const Color gray3 = Color(0xFFAAADB2);
  static const Color gray4 = Color(0xFFF6F7F8);
  static const Color gray5 = Color(0xFFA9ACB2);
  static const Color gray6 = Color(0xFFAAADB3);
  static const Color gray7 = Color(0xFFEEF0F3);
  static const Color gray8 = Color(0xFF6A6875);
  static const Color gray9 = Color(0xFF9D9FA1);
  static const Color gray10 = Color(0xFFEDF0F5);
  static const Color gray11 = Color(0xFFF3F3F5);
  static const Color gray12 = Color(0x33C2C5CC);
  static const Color gray13 = Color(0x33D5D7DB);
  static const Color gray14 = Color(0xA68C919C);
  static const Color gray15 = Color(0xFFEDEFF2);
  static const Color gray16 = Color(0xFFD8D8D8);

  static const Color black = Color(0xFF000000);
  static const Color black2 = Color(0xFF1F1E26);
  static const Color black3 = Color(0xFF34333B);
  static const Color black4 = Color(0xE634333B);
  static const Color black5 = Color(0xE62D2C37);
  static const Color black6 = Color(0xFF484751);
  static const Color black7 = Color(0xFF282830);
  static const Color black8 = Color(0xFF323139);
  static const Color black9 = Color(0xFF171717);

  static const Color surfaceShadow = Color(0x408C919C);

  static const Color yellow = Color(0x66DFF14C);
  static const Color yellow2 = Color(0x33DFF14C);
  static const Color yellow3 = Color(0x1ADFF14C);
  static const Color yellow4 = Color(0xFFBDCC40);
  static const Color brightAcid = Color(0xFFD4E548);
  static const Color brightAcid2 = Color(0xFFCAE30B);

  static const Color red = Color(0xFFFF2F2F);

  static const Color blue = Color(0xFF007AFF);

  // static const Color startGradientBackground = Color(0x00343240);
  static const Color startGradientBackground = Color(0xFF343240);
  // static const Color endGradientBackground = Color(0xBF1E1D25);
  static const Color endGradientBackground = Color(0xFF1E1D25);

  static const Color darkBlue = Color(0xFF262C34);

  static const Color startPhotoFooterGradient = Color(0x6614171C);
  static const Color endPhotoFooterGradient = Color(0xFF000000);
  static const Color grey40 = Color(0x66C4C4C4);
  static const Color black40 = Color(0x6614171C);
  static const Color black30 = Color(0x4D000000);

  static const Color grey21 = Color(0xFFEAECEF);

  static const Color startFloatingGradient = Color(0x00F9FAFC);
  static const Color endFloatingGradient = Color(0xFFF9FAFC);

  static const Color startImageTopGradient = Color(0xFFFFFFFF);
  static const Color endImageTopGradient = Color(0x00FFFFFF);

  static const Color startImageBottomGradient = Color(0x00FFFFFF);
  static const Color endImageBottomGradient = Color(0xFFFFFFFF);



  static Color? getColor(String? color) {
    if (color?.length != 7) {
      return null;
    }
    color = color?.replaceFirst('#', '0xFF');
    int? value = int.tryParse(color ?? '');
    return value != null ? Color(value) : null;
  }
}

import 'package:flutter/material.dart';

class AppColors {
  /* ── Primary ── */
  static const Color primaryColor = Color(0xff0F2D6E);
  static const Color primaryDarkColor = Color(0xff0a1f4e);
  static const Color primaryLightColor = Color(0xff1a3a80);
  static const Color primary30Opacity = Color(0x4D0F2D6E);

  /* ── Secondary ── */
  static const Color secondaryColor = Color(0xff1E4DB7);
  static const Color secondaryHoverColor = Color(0xff1a42a0);

  /* ── Accent (Gold) ── */
  static const Color accentColor = Color(0xffD4AF37);
  static const Color accentLightColor = Color(0xffEBC447);
  static const Color accentDarkColor = Color(0xffA6892C);
  static const Color accentLightersColor = Color(0xffF2DB94);

  /* ── Surfaces ── */
  static const Color surfaceColor = Color(0xffF4F6FB);
  static const Color surfaceLightColor = Color(0xffE8F0FB);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color lightBlack = Color(0xff2F2929);

  /* ── Text ── */
  static const Color textPrimaryColor = Color(0xff0F2D6E);
  static const Color textBodyColor = Color(0xff334155);
  static const Color textMutedColor = Color(0xff64748B);
  static const Color textSubtleColor = Color(0xff94A3B8);
  static const Color hintTextColor = Color(0xB3000000);

  /* ── Borders ── */
  static const Color borderColor = Color(0xffD1DCF0);
  static const Color borderLightColor = Color(0xffE8F0FB);
  static const Color borderDarkColor = Color(0xffBEC8DB);
  static const Color borderLightTransperantColor = Color(0x1A7A7A7C);

  /* ── Semantic (Status) ── */
  static const Color successColor = Color(0xff22C55E);
  static const Color warningColor = Color(0xffF59E0B);
  static const Color dangerColor = Color(0xffEF4444);
  static const Color neutralColor = Color(0xff64748B);

  /* ── Radii ── */
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  static const Color transparentColor = Colors.transparent;

  /* ── Shadows ── */
  static const List<BoxShadow> shadowSm = [
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 3,
      color: Color(0x140F2D6E), // rgba(15,45,110,0.08)
    ),
    BoxShadow(
      offset: Offset(0, 1),
      blurRadius: 2,
      color: Color(0x0F0F2D6E), // rgba(15,45,110,0.06)
    ),
  ];

  static const List<BoxShadow> shadowMd = [
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 16,
      color: Color(0x1A0F2D6E), // rgba(15,45,110,0.10)
    ),
    BoxShadow(
      offset: Offset(0, 2),
      blurRadius: 6,
      color: Color(0x0F0F2D6E), // rgba(15,45,110,0.06)
    ),
  ];

  static const List<BoxShadow> shadowLg = [
    BoxShadow(
      offset: Offset(0, 8),
      blurRadius: 32,
      color: Color(0x240F2D6E), // rgba(15,45,110,0.14)
    ),
    BoxShadow(
      offset: Offset(0, 4),
      blurRadius: 12,
      color: Color(0x140F2D6E), // rgba(15,45,110,0.08)
    ),
  ];

  static const List<BoxShadow> shadowAccent = [
    BoxShadow(
      offset: Offset(0, 8),
      blurRadius: 24,
      color: Color(0x40C8A84B), // rgba(200,168,75,0.25)
    ),
  ];

  /* ── Transition ── */
  static const Duration transitionDuration = Duration(milliseconds: 200);
  static const Curve transitionCurve = Cubic(0.4, 0, 0.2, 1);
}

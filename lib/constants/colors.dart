import 'package:flutter/material.dart';

/// Ocean depth palette — surface to abyss as the user scrolls down
class CustomColor {
  // ── Ocean layers (section backgrounds) ──
  static const Color surface    = Color(0xFFE8F4FD); // sunlit surface
  static const Color shallow    = Color(0xFFB3D9F2); // shallow water
  static const Color midwater   = Color(0xFF4A90C4); // mid water
  static const Color deep       = Color(0xFF1B5E8A); // deep zone
  static const Color abyss      = Color(0xFF0A2744); // twilight zone
  static const Color trench     = Color(0xFF041624); // hadal trench / footer

  // ── Accent ──
  static const Color accentCyan      = Color(0xFF00D4FF); // bioluminescent glow
  static const Color accentTeal      = Color(0xFF00B4A0); // deep teal glow
  static const Color accentLight     = Color(0xFFE0F7FF); // foam white

  // ── Text (adapts per section) ──
  static const Color textOnLight     = Color(0xFF0A2744); // dark text on light bg
  static const Color textOnDark      = Color(0xFFE0F7FF); // light text on dark bg
  static const Color textSubOnLight  = Color(0xFF2A6B9C); // subdued on light
  static const Color textSubOnDark   = Color(0xFF7EC8E3); // subdued on dark

  // ── Cards / Glass ──
  static const Color cardOnLight     = Color(0xFFFFFFFF);
  static const Color cardOnDark      = Color(0x1A00D4FF); // glassy blue tint
  static const Color borderOnLight   = Color(0xFFB3D9F2);
  static const Color borderOnDark    = Color(0x3300D4FF);

  // ── Legacy aliases so existing imports don't break ──
  static const Color bgPrimary    = surface;
  static const Color bgSecondary  = shallow;
  static const Color bgCard       = cardOnLight;
  static const Color bgSection    = midwater;
  static const Color glassBorder  = borderOnDark;
  static const Color glassBackground = cardOnDark;
  static const Color accentPurple = Color(0xFF0077B6);
  static const Color textPrimary  = textOnDark;
  static const Color textSecondary = textSubOnDark;
  static const Color textMuted    = Color(0xFF4A90C4);
  static const Color level2       = shallow;
  static const Color level3       = midwater;
  static const Color level4       = deep;
  static const Color level5       = abyss;
  static const Color level6       = trench;
}
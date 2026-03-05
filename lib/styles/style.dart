import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

BoxDecoration kHeaderDecoration = BoxDecoration(
  color: CustomColor.bgPrimary.withOpacity(0.92),
  border: Border.all(color: CustomColor.glassBorder, width: 1),
  borderRadius: BorderRadius.circular(100),
  boxShadow: [
    BoxShadow(
      color: CustomColor.accentCyan.withOpacity(0.06),
      blurRadius: 24,
      spreadRadius: 0,
    ),
  ],
);

BoxDecoration kGlassDecoration = BoxDecoration(
  color: CustomColor.glassBackground,
  border: Border.all(color: CustomColor.glassBorder, width: 1),
  borderRadius: BorderRadius.circular(16),
  boxShadow: [
    BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20),
  ],
);

BoxDecoration kSectionDecoration(Color bg) => BoxDecoration(color: bg);
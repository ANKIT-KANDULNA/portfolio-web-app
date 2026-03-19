import 'package:flutter/material.dart';

class EntityLogo extends StatelessWidget {
  final String? logo;
  final double size;
  final IconData fallbackIcon;
  final Color accentColor;

  const EntityLogo({
    super.key,
    required this.logo,
    this.size = 52,
    this.fallbackIcon = Icons.business_rounded,
    this.accentColor = const Color(0xFF00D4FF),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.12)),
      ),
      child: logo != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Image.asset(
                logo!,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  fallbackIcon,
                  size: size * 0.45,
                  color: accentColor,
                ),
              ),
            )
          : Icon(
              fallbackIcon,
              size: size * 0.45,
              color: accentColor,
            ),
    );
  }
}
import 'package:flutter/material.dart';

class SiteLogo extends StatefulWidget {
  const SiteLogo({super.key, this.onTap, this.onDarkBg = false});
  final VoidCallback? onTap;
  final bool onDarkBg;

  @override
  State<SiteLogo> createState() => _SiteLogoState();
}

class _SiteLogoState extends State<SiteLogo> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final nameColor = _hovered
        ? const Color(0xFF00B4A0)
        : widget.onDarkBg
            ? Colors.white
            : const Color(0xFF0A3D5C);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "ANKIT",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: nameColor,
                    letterSpacing: 2,
                  ),
                ),
                const TextSpan(
                  text: ".",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF00B4A0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
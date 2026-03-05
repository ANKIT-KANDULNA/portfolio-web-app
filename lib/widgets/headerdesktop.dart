import 'package:flutter/material.dart';
import 'package:myportfolio/constants/nav_items.dart';
import 'package:myportfolio/widgets/sitelogo.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({
    super.key,
    required this.onNavMenuTap,
    this.isScrolled = false,
  });
  final Function(int) onNavMenuTap;
  final bool isScrolled;

  @override
  State<HeaderDesktop> createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  int _hoveredIndex = -1;

  Color get _navColor => widget.isScrolled
      ? Colors.white.withOpacity(0.85)
      : const Color(0xFF0A3D5C); // dark navy on light surface

  Color get _hoverColor => const Color(0xFF00B4A0);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      height: widget.isScrolled ? 68 : 80,
      margin: EdgeInsets.symmetric(
        vertical: widget.isScrolled ? 10 : 16,
        horizontal: 32,
      ),
      decoration: BoxDecoration(
        color: widget.isScrolled
            ? const Color(0xFF0A2038).withOpacity(0.88)
            : Colors.transparent,
        border: Border.all(
          color: widget.isScrolled
              ? Colors.white.withOpacity(0.12)
              : Colors.transparent,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(100),
        boxShadow: widget.isScrolled
            ? [BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 24)]
            : [],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _OceanLogo(
            onTap: () => widget.onNavMenuTap(0),
            onDarkBg: widget.isScrolled,
          ),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 36),
              child: MouseRegion(
                onEnter: (_) => setState(() => _hoveredIndex = i),
                onExit:  (_) => setState(() => _hoveredIndex = -1),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => widget.onNavMenuTap(i),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 180),
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                          color: _hoveredIndex == i ? _hoverColor : _navColor,
                        ),
                        child: Text(navTitles[i].toUpperCase()),
                      ),
                      const SizedBox(height: 4),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        height: 2,
                        width: _hoveredIndex == i ? 24 : 0,
                        decoration: BoxDecoration(
                          color: _hoverColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _OceanLogo extends StatefulWidget {
  final VoidCallback onTap;
  final bool onDarkBg;
  const _OceanLogo({required this.onTap, required this.onDarkBg});
  @override State<_OceanLogo> createState() => _OceanLogoState();
}

class _OceanLogoState extends State<_OceanLogo> {
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
                  text: "ANKIT KANDULNA",
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
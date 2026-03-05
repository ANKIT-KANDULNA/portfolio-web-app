import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/nav_items.dart';
import 'package:myportfolio/constants/colors.dart' show CustomColor;

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.bgSecondary,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 36, 28, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "ANKIT",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                        TextSpan(
                          text: ".",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: CustomColor.accentCyan,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Flutter Developer",
                    style: TextStyle(
                      fontSize: 12,
                      color: CustomColor.textMuted,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
              child: Container(
                height: 1,
                color: CustomColor.glassBorder,
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 8, 28, 16),
              child: Text(
                "NAVIGATION",
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 3,
                  color: CustomColor.textMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            for (int i = 0; i < navTitles.length; i++)
              _DrawerNavItem(
                title: navTitles[i],
                icon: navIcons[i],
                index: i,
                onTap: () => onNavItemTap(i),
              ),
          ],
        ),
      ),
    );
  }
}

class _DrawerNavItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final int index;
  final VoidCallback onTap;
  const _DrawerNavItem({
    required this.title,
    required this.icon,
    required this.index,
    required this.onTap,
  });

  @override
  State<_DrawerNavItem> createState() => _DrawerNavItemState();
}

class _DrawerNavItemState extends State<_DrawerNavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered
                ? CustomColor.accentCyan.withOpacity(0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border(
              left: BorderSide(
                color: _hovered ? CustomColor.accentCyan : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: 16,
                color: _hovered ? CustomColor.accentCyan : CustomColor.textMuted,
              ),
              const SizedBox(width: 14),
              Text(
                navTitles[widget.index].toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  color: _hovered
                      ? CustomColor.accentCyan
                      : CustomColor.textSecondary,
                ),
              ),
              const Spacer(),
              AnimatedOpacity(
                opacity: _hovered ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 14,
                  color: CustomColor.accentCyan,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
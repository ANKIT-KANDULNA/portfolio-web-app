import 'package:flutter/material.dart';
import 'package:myportfolio/widgets/sitelogo.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({
    super.key,
    this.onLogoTap,
    this.onMenuTap,
    this.isScrolled = false,
  });
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  final bool isScrolled;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 60,
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 6),
      padding: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: isScrolled
            ? const Color(0xFF0A2038).withOpacity(0.88)
            : Colors.white.withOpacity(0.25),
        border: Border.all(
          color: isScrolled
              ? Colors.white.withOpacity(0.12)
              : const Color(0xFF0A3D5C).withOpacity(0.15),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isScrolled ? 0.3 : 0.08),
            blurRadius: 16,
          ),
        ],
      ),
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap, onDarkBg: isScrolled),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: Icon(
              Icons.menu_rounded,
              color: isScrolled ? Colors.white : const Color(0xFF0A3D5C),
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
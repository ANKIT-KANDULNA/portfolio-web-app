import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolio/constants/skillitems.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _MobileSkillGroup(label: "PLATFORMS & DOMAINS", items: platformItems),
        SizedBox(height: 32),
        _MobileSkillGroup(label: "LANGUAGES & TOOLS",   items: skillItems),
      ],
    );
  }
}

class _MobileSkillGroup extends StatelessWidget {
  final String label;
  final List<Map> items;
  const _MobileSkillGroup({required this.label, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label tag
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Text(label, style: const TextStyle(
            fontSize: 9, letterSpacing: 3,
            color: Color(0xFF00D4FF), fontWeight: FontWeight.w700,
          )),
        ),

        // ── Wrap instead of ListView — all chips visible ──
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final item in items)
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      item['img'],
                      width: 22, height: 22,
                      errorBuilder: (_, __, ___) => const Icon(
                          Icons.code_rounded,
                          size: 22, color: Colors.white70),
                    ),
                    const SizedBox(width: 8),
                    Text(item['title'], style: const TextStyle(
                      fontSize: 12, color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
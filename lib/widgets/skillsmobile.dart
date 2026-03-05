import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolio/constants/skillitems.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _MobileSkillRow(label: "PLATFORMS & DOMAINS", items: platformItems),
        SizedBox(height: 32),
        _MobileSkillRow(label: "LANGUAGES & TOOLS",   items: skillItems),
      ],
    );
  }
}

class _MobileSkillRow extends StatelessWidget {
  final String label;
  final List<Map> items;
  const _MobileSkillRow({required this.label, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 2, bottom: 14),
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
        SizedBox(
          height: 64,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (_, i) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.10),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(items[i]['img'], width: 20, height: 20,
                    errorBuilder: (_, __, ___) => const Icon(
                        Icons.code_rounded, size: 20, color: Colors.white70)),
                  const SizedBox(width: 8),
                  Text(items[i]['title'], style: const TextStyle(
                    fontSize: 12, color: Colors.white, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
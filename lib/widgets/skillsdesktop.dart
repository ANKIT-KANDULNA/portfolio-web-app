import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolio/constants/skillitems.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── LEFT: Platforms & Domains ──
        Expanded(
          child: _SkillColumn(
            label: "PLATFORMS & DOMAINS",
            icon: Icons.devices_rounded,
            items: platformItems,
          ),
        ),

        // Divider
        Container(
          width: 1,
          margin: const EdgeInsets.symmetric(horizontal: 32),
          color: Colors.white.withOpacity(0.15),
        ),

        // ── RIGHT: Languages & Tools ──
        Expanded(
          child: _SkillColumn(
            label: "LANGUAGES & TOOLS",
            icon: Icons.code_rounded,
            items: skillItems,
          ),
        ),
      ],
    );
  }
}

class _SkillColumn extends StatelessWidget {
  final String label;
  final IconData icon;
  final List<Map> items;
  const _SkillColumn({
    required this.label,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Column header
        Row(
          children: [
            Icon(icon, size: 16, color: const Color(0xFF00D4FF)),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.white.withOpacity(0.18)),
              ),
              child: Text(label, style: const TextStyle(
                fontSize: 10, letterSpacing: 3,
                color: Color(0xFF00D4FF), fontWeight: FontWeight.w700,
              )),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Skill chips — wrapping within the column
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final item in items) _SkillChip(item: item),
          ],
        ),
      ],
    );
  }
}

class _SkillChip extends StatefulWidget {
  final Map item;
  const _SkillChip({required this.item});
  @override State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 180));
    _scale = Tween<double>(begin: 1.0, end: 1.07)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }
  @override void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) { setState(() => _hovered = true);  _ctrl.forward(); },
      onExit:  (_) { setState(() => _hovered = false); _ctrl.reverse(); },
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          decoration: BoxDecoration(
            color: _hovered
                ? Colors.white.withOpacity(0.18)
                : Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? const Color(0xFF00D4FF).withOpacity(0.65)
                  : Colors.white.withOpacity(0.15),
              width: 1.5,
            ),
            boxShadow: _hovered ? [BoxShadow(
              color: const Color(0xFF00D4FF).withOpacity(0.18),
              blurRadius: 14,
            )] : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(widget.item['img'], width: 24, height: 24,
                errorBuilder: (_, __, ___) => const Icon(
                    Icons.code_rounded, size: 24, color: Colors.white70)),
              const SizedBox(width: 10),
              Text(widget.item['title'], style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w600,
                color: _hovered ? const Color(0xFF00D4FF) : Colors.white,
                letterSpacing: 0.3,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
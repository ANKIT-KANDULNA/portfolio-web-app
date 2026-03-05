import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolio/utils/projectutils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/utils/open_link.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.project});
  final ProjectUtils project;
  @override State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _hovered = false;
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _scale = Tween<double>(begin: 1.0, end: 1.03)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }
  @override void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) { setState(() => _hovered = true);  _ctrl.forward(); },
      onExit:  (_) { setState(() => _hovered = false); _ctrl.reverse(); },
      cursor: SystemMouseCursors.click,
      child: ScaleTransition(
        scale: _scale,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          // Fixed width is set by parent SizedBox(width: 280)
          decoration: BoxDecoration(
            color: const Color(0xFF0A2744),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? const Color(0xFF00D4FF).withOpacity(0.5)
                  : Colors.white.withOpacity(0.1),
              width: 1.5,
            ),
            boxShadow: _hovered
                ? [BoxShadow(
                    color: const Color(0xFF00D4FF).withOpacity(0.15),
                    blurRadius: 28,
                  )]
                : [BoxShadow(color: Colors.black.withOpacity(0.3),
                    blurRadius: 8)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // ── Image — fixed aspect ratio ──
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(widget.project.image,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: const Color(0xFF1B5E8A),
                          child: const Icon(Icons.code_rounded,
                              color: Color(0xFF00D4FF), size: 40),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              const Color(0xFF0A2744).withOpacity(0.8),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Content ──
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.project.title,
                      style: TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700,
                        color: _hovered
                            ? const Color(0xFF00D4FF)
                            : Colors.white,
                        letterSpacing: 0.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(widget.project.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12, height: 1.5,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Link chips ──
                    Wrap(
                      spacing: 6, runSpacing: 6,
                      children: [
                        if (widget.project.githubLink != null)
                          _Chip(img: 'assets/icons/github.svg',  label: 'GitHub',
                              onTap: () => openLink(widget.project.githubLink!)),
                        if (widget.project.webLink != null)
                          _Chip(img: 'assets/icons/web.svg',     label: 'Web',
                              onTap: () => openLink(widget.project.webLink!)),
                        if (widget.project.androidLink != null)
                          _Chip(img: 'assets/icons/android-original.svg', label: 'Android',
                              onTap: () => openLink(widget.project.androidLink!)),
                        if (widget.project.iosLink != null)
                          _Chip(img: 'assets/icons/apple-original.svg',     label: 'iOS',
                              onTap: () => openLink(widget.project.iosLink!)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatefulWidget {
  final String img, label;
  final VoidCallback onTap;
  const _Chip({required this.img, required this.label, required this.onTap});
  @override State<_Chip> createState() => _ChipState();
}
class _ChipState extends State<_Chip> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: _h ? const Color(0xFF00D4FF).withOpacity(0.12)
                    : Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _h ? const Color(0xFF00D4FF).withOpacity(0.5)
                      : Colors.white.withOpacity(0.12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(widget.img, width: 12, height: 12,
              errorBuilder: (_, __, ___) => const Icon(
                  Icons.open_in_new_rounded, size: 10, color: Colors.white54)),
            const SizedBox(width: 5),
            Text(widget.label, style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w600,
              color: _h ? const Color(0xFF00D4FF)
                        : Colors.white.withOpacity(0.6),
            )),
          ],
        ),
      ),
    ),
  );
}
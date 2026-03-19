import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:myportfolio/utils/experienceutils.dart';
import 'package:myportfolio/widgets/entitylogo.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 88, horizontal: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1B5E8A), Color(0xFF0D3B60)],
        ),
      ),
      child: Column(
        children: [
          // ── Header ──
          _SectionHeader(
            tag: "EXPERIENCE",
            title: "Where I've Worked",
            subtitle: "Diving into real-world waters",
          ),
          const SizedBox(height: 64),

          // ── Timeline ──
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: experienceList.isEmpty
                ? _EmptyState(
                    icon: Icons.work_outline_rounded,
                    message: "Experience coming soon —\nI'm still diving in! 🤿",
                  )
                : Column(
                    children: [
                      for (int i = 0; i < experienceList.length; i++)
                        _TimelineItem(
                          experience: experienceList[i],
                          isLast: i == experienceList.length - 1,
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

// ── Timeline item ──
class _TimelineItem extends StatefulWidget {
  final ExperienceUtils experience;
  final bool isLast;
  const _TimelineItem({required this.experience, required this.isLast});
  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;
  late AnimationController _ctrl;
  late Animation<double> _fade;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    // Auto-expand the first item
    if (!widget.isLast || true) _ctrl.forward();
    _expanded = true;
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Timeline spine ──
          Column(
            children: [
              // Dot
              Container(
                width: 16, height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF00D4FF),
                  boxShadow: [BoxShadow(
                    color: const Color(0xFF00D4FF).withOpacity(0.4),
                    blurRadius: 10, spreadRadius: 2,
                  )],
                ),
              ),
              // Line
              if (!widget.isLast)
                Expanded(
                  child: Container(
                    width: 1.5,
                    color: Colors.white.withOpacity(0.12),
                  ),
                ),
            ],
          ),

          const SizedBox(width: 24),

          // ── Card ──
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: _ExperienceCard(
                experience: widget.experience,
                expanded: _expanded,
                fade: _fade,
                onToggle: () {
                  setState(() => _expanded = !_expanded);
                  _expanded ? _ctrl.forward() : _ctrl.reverse();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceUtils experience;
  final bool expanded;
  final Animation<double> fade;
  final VoidCallback onToggle;
  const _ExperienceCard({
    required this.experience,
    required this.expanded,
    required this.fade,
    required this.onToggle,
  });
  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovered = false;

  Color get _accent =>  const Color(0xFF00D4FF);

  @override
  Widget build(BuildContext context) {
    final e = widget.experience;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF0D2F4A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? const Color(0xFF00D4FF).withOpacity(0.4)
                : Colors.white.withOpacity(0.08),
            width: 1.5,
          ),
          boxShadow: _hovered ? [BoxShadow(
            color: const Color(0xFF00D4FF).withOpacity(0.08),
            blurRadius: 24,
          )] : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top row: role + type badge ──
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EntityLogo(
                  logo: e.logo,
                  size: 52,
                  fallbackIcon: Icons.business_rounded,
                  accentColor: const Color(0xFF00D4FF),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.role, style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700,
                        color: Colors.white, letterSpacing: 0.2,
                      )),
                      const SizedBox(height: 6),
                      // Company name — tappable if URL exists
                      // Institution
                      _ClickableUrl(
                        label: e.company,
                        url: e.companyUrl,
                        accent: _accent,
                      ),

                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                // Type badge
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00D4FF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                        color: const Color(0xFF00D4FF).withOpacity(0.3)),
                  ),
                  child: Text(e.type, style: const TextStyle(
                    fontSize: 11, fontWeight: FontWeight.w600,
                    color: Color(0xFF00D4FF), letterSpacing: 0.5,
                  )),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // ── Meta: duration + location ──
            Row(
              children: [
                Icon(Icons.calendar_today_outlined,
                    size: 13, color: Colors.white.withOpacity(0.4)),
                const SizedBox(width: 6),
                Text(e.duration, style: TextStyle(
                  fontSize: 13, color: Colors.white.withOpacity(0.5))),
                const SizedBox(width: 16),
                Icon(Icons.location_on_outlined,
                    size: 13, color: Colors.white.withOpacity(0.4)),
                const SizedBox(width: 4),
                Text(e.location, style: TextStyle(
                  fontSize: 13, color: Colors.white.withOpacity(0.5))),
              ],
            ),

            const SizedBox(height: 16),

            // ── Bullet points ──
            FadeTransition(
              opacity: widget.fade,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final point in e.points)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 7),
                            width: 5, height: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF00B4A0),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(point, style: TextStyle(
                              fontSize: 14, height: 1.6,
                              color: Colors.white.withOpacity(0.7),
                            )),
                          ),
                        ],
                      ),
                    ),

                  if (e.techUsed.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    Wrap(spacing: 8, runSpacing: 8,
                      children: [
                        for (final tech in e.techUsed)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.06),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.12)),
                            ),
                            child: Text(tech, style: const TextStyle(
                              fontSize: 11, color: Color(0xFF7EC8E3),
                              fontWeight: FontWeight.w500,
                            )),
                          ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Empty state ──
class _EmptyState extends StatelessWidget {
  final IconData icon;
  final String message;
  const _EmptyState({required this.icon, required this.message});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 32),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.04),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withOpacity(0.08)),
    ),
    child: Column(children: [
      Icon(icon, size: 48, color: Colors.white.withOpacity(0.2)),
      const SizedBox(height: 16),
      Text(message,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, height: 1.7,
            color: Colors.white.withOpacity(0.4))),
    ]),
  );
}

// ── Shared section header ──
class _SectionHeader extends StatelessWidget {
  final String tag, title, subtitle;
  const _SectionHeader({
    required this.tag,
    required this.title,
    required this.subtitle,
  });
  @override
  Widget build(BuildContext context) => Column(children: [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.white.withOpacity(0.35)),
    ),
    child: Text(tag, style: const TextStyle(
      fontSize: 10, letterSpacing: 3,
      color: Colors.white, fontWeight: FontWeight.w700,
    )),
    ),
    const SizedBox(height: 16),
    Text(title, textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900,
        color: Colors.white, letterSpacing: -0.5)),
    const SizedBox(height: 10),
    Text(subtitle, style: TextStyle(
        fontSize: 15, color: Colors.white.withOpacity(0.5))),
  ]);
}


class _ClickableUrl extends StatefulWidget {
  final String label;
  final String? url;
  final Color accent;
  const _ClickableUrl({
    required this.label,
    required this.url,
    required this.accent,
  });
  @override
  State<_ClickableUrl> createState() => _ClickableUrlState();
}

class _ClickableUrlState extends State<_ClickableUrl> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      cursor: widget.url != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.url != null ? () => openLink(widget.url!) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: _hovered && widget.url != null
                ? widget.accent.withOpacity(0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered && widget.url != null
                  ? widget.accent.withOpacity(0.35)
                  : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.account_balance_outlined,
                size: 15,
                color: _hovered && widget.url != null
                    ? widget.accent
                    : Colors.white54,
              ),
              const SizedBox(width: 8),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 180),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _hovered && widget.url != null
                      ? widget.accent
                      : Colors.white.withOpacity(0.8),
                  decoration: _hovered && widget.url != null
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  decorationColor: widget.accent,
                ),
                child: Text(widget.label),
              ),
              if (widget.url != null) ...[
                const SizedBox(width: 6),
                AnimatedOpacity(
                  opacity: _hovered ? 1.0 : 0.3,
                  duration: const Duration(milliseconds: 180),
                  child: Icon(
                    Icons.open_in_new_rounded,
                    size: 13,
                    color: _hovered ? widget.accent : Colors.white38,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
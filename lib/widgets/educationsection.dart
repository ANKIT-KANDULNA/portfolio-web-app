import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:myportfolio/utils/educationutils.dart';
import 'package:myportfolio/widgets/entitylogo.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 88, horizontal: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0A2744), Color(0xFF061830)],
        ),
      ),
      child: Column(
        children: [
          _SectionHeader(
            tag: "EDUCATION",
            title: "My Learning Journey",
            subtitle: "The foundations I was built on",
          ),
          const SizedBox(height: 64),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860),
            child: educationList.isEmpty
                ? _EmptyState()
                : Column(
                    children: [
                      for (int i = 0; i < educationList.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _EducationCard(
                              education: educationList[i], index: i),
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _EducationCard extends StatefulWidget {
  final EducationUtils education;
  final int index;
  const _EducationCard({required this.education, required this.index});
  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard> {
  bool _hovered = false;

  Color get _accent => widget.index % 2 == 0
      ? const Color(0xFF00D4FF)
      : const Color(0xFF00B4A0);

  @override
  Widget build(BuildContext context) {
    final e = widget.education;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        decoration: BoxDecoration(
          color: const Color(0xFF0D2F4A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? _accent.withOpacity(0.45)
                : Colors.white.withOpacity(0.08),
            width: 1.5,
          ),
          boxShadow: _hovered
              ? [BoxShadow(
                  color: _accent.withOpacity(0.1), blurRadius: 24)]
              : [],
        ),
        // ── FIX: use Stack instead of Row+stretch for the left bar ──
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Left accent bar — positioned, not stretched
              Positioned(
                left: 0, top: 0, bottom: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: 4,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [_accent, _accent.withOpacity(0.3)],
                    ),
                  ),
                ),
              ),

              // Content with left padding to clear the bar
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Degree + grade badge
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Logo ──
                        EntityLogo(
                          logo: e.logo,
                          size: 52,
                          fallbackIcon: Icons.school_outlined,
                          accentColor: _accent,
                        ),
                        const SizedBox(width: 16),

                        // Degree + grade
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.degree, style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700,
                                color: Colors.white)),
                              const SizedBox(height: 4),
                              Text(e.field, style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500,
                                color: _accent)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: _accent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: _accent.withOpacity(0.3)),
                          ),
                          child: Text(e.grade, style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w700,
                            color: _accent)),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    // Institution
                    _ClickableUrl(
                      label: e.institution,
                      url: e.institutionUrl,
                      accent: _accent,
                    ),

                    const SizedBox(height: 8),

                    // Duration + location
                    Row(children: [
                      Icon(Icons.calendar_today_outlined,
                          size: 13, color: Colors.white38),
                      const SizedBox(width: 6),
                      Text(e.duration, style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.45))),
                      const SizedBox(width: 16),
                      Icon(Icons.location_on_outlined,
                          size: 13, color: Colors.white38),
                      const SizedBox(width: 4),
                      Expanded(child: Text(e.location, style: TextStyle(
                          fontSize: 13,
                          color: Colors.white.withOpacity(0.45)))),
                    ]),

                    // Highlights
                    if (e.highlights.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Divider(
                          color: Colors.white.withOpacity(0.07),
                          thickness: 1),
                      const SizedBox(height: 12),
                      for (final h in e.highlights)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 7),
                                width: 5, height: 5,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _accent.withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(child: Text(h, style: TextStyle(
                                fontSize: 13, height: 1.6,
                                color: Colors.white.withOpacity(0.6)))),
                            ],
                          ),
                        ),
                    ],
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

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 56, horizontal: 32),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.04),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withOpacity(0.08)),
    ),
    child: Column(children: [
      Icon(Icons.school_outlined,
          size: 48, color: Colors.white.withOpacity(0.2)),
      const SizedBox(height: 16),
      Text("Education details coming soon 📚",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, height: 1.7,
            color: Colors.white.withOpacity(0.4))),
    ]),
  );
}

class _SectionHeader extends StatelessWidget {
  final String tag, title, subtitle;
  const _SectionHeader(
      {required this.tag, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Column(children: [
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF00D4FF).withOpacity(0.08),
        borderRadius: BorderRadius.circular(6),
        border:
            Border.all(color: const Color(0xFF00D4FF).withOpacity(0.3)),
      ),
      child: Text(tag, style: const TextStyle(
        fontSize: 10, letterSpacing: 3,
        color: Color(0xFF00D4FF), fontWeight: FontWeight.w700)),
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
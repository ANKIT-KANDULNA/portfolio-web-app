import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:myportfolio/utils/educationutils.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

class EducationMobile extends StatelessWidget {
  const EducationMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0A2744),
            Color(0xFF061830),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Tag ──
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white.withOpacity(0.35)),
            ),
            child: const Text("EDUCATION", style: TextStyle(
              fontSize: 10, letterSpacing: 3,
              color: Colors.white, fontWeight: FontWeight.w700,
            )),
          ),
          const SizedBox(height: 14),

          const Text("My Learning Journey",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900,
              color: Colors.white, letterSpacing: -0.5,
            )),
          const SizedBox(height: 8),
          Text("The foundations I was built on",
            style: TextStyle(
                fontSize: 14, color: Colors.white.withOpacity(0.5))),
          const SizedBox(height: 40),

          // ── Cards ──
          educationList.isEmpty
              ? _EmptyState()
              : Column(
                  children: [
                    for (int i = 0; i < educationList.length; i++)
                      _MobileEduCard(
                          education: educationList[i], index: i),
                  ],
                ),
        ],
      ),
    );
  }
}

class _MobileEduCard extends StatelessWidget {
  final EducationUtils education;
  final int index;
  const _MobileEduCard(
      {required this.education, required this.index});

  Color get _accent => index % 2 == 0
      ? const Color(0xFF00D4FF)
      : const Color(0xFF00B4A0);

  @override
  Widget build(BuildContext context) {
    final e = education;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D2F4A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Left accent bar
            Positioned(
              left: 0, top: 0, bottom: 0,
              child: Container(
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

            // Content
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Degree + grade badge
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.degree, style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w700,
                              color: Colors.white, height: 1.3,
                            )),
                            const SizedBox(height: 3),
                            Text(e.field, style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500,
                              color: _accent,
                            )),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: _accent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              color: _accent.withOpacity(0.3)),
                        ),
                        child: Text(e.grade, style: TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w700,
                          color: _accent,
                        )),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Institution — tappable
                  GestureDetector(
                    onTap: e.institutionUrl != null
                        ? () => openLink(e.institutionUrl!)
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_balance_outlined,
                            size: 13, color: Colors.white54),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(e.institution, style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600,
                            color: Colors.white.withOpacity(0.8),
                          )),
                        ),
                        if (e.institutionUrl != null) ...[
                          const SizedBox(width: 4),
                          Icon(Icons.open_in_new_rounded,
                              size: 11,
                              color: Colors.white.withOpacity(0.4)),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Duration
                  Row(children: [
                    Icon(Icons.calendar_today_outlined,
                        size: 12, color: Colors.white38),
                    const SizedBox(width: 5),
                    Text(e.duration, style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.45))),
                  ]),
                  const SizedBox(height: 4),

                  // Location
                  Row(children: [
                    Icon(Icons.location_on_outlined,
                        size: 12, color: Colors.white38),
                    const SizedBox(width: 5),
                    Expanded(child: Text(e.location, style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.45)))),
                  ]),

                  // Highlights
                  if (e.highlights.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Divider(
                        color: Colors.white.withOpacity(0.07),
                        thickness: 1),
                    const SizedBox(height: 10),
                    for (final h in e.highlights)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 6),
                              width: 4, height: 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _accent.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(child: Text(h, style: TextStyle(
                              fontSize: 12, height: 1.6,
                              color: Colors.white.withOpacity(0.6),
                            ))),
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
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.04),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white.withOpacity(0.08)),
    ),
    child: Column(children: [
      Icon(Icons.school_outlined,
          size: 40, color: Colors.white.withOpacity(0.2)),
      const SizedBox(height: 14),
      Text("Education details coming soon 📚",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, height: 1.7,
            color: Colors.white.withOpacity(0.4))),
    ]),
  );
}
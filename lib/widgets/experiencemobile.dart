import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:myportfolio/utils/experienceutils.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

class ExperienceMobile extends StatelessWidget {
  const ExperienceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 72, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1B5E8A),
            Color(0xFF1B5E8A),
            Color(0xFF0F3460),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Tag ──
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white.withOpacity(0.35)),
            ),
            child: const Text("EXPERIENCE", style: TextStyle(
              fontSize: 10, letterSpacing: 3,
              color: Colors.white, fontWeight: FontWeight.w700,
            )),
          ),
          const SizedBox(height: 14),

          const Text("Where I've Worked",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w900,
              color: Colors.white, letterSpacing: -0.5,
            )),
          const SizedBox(height: 8),
          Text("Diving into real-world waters",
            style: TextStyle(
                fontSize: 14, color: Colors.white.withOpacity(0.5))),
          const SizedBox(height: 40),

          // ── Cards ──
          experienceList.isEmpty
              ? _EmptyState()
              : Column(
                  children: [
                    for (final e in experienceList)
                      _MobileExpCard(experience: e),
                  ],
                ),
        ],
      ),
    );
  }
}

class _MobileExpCard extends StatelessWidget {
  final ExperienceUtils experience;
  const _MobileExpCard({required this.experience});

  @override
  Widget build(BuildContext context) {
    final e = experience;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0D2F4A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Role + type badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(e.role, style: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w700,
                  color: Colors.white, height: 1.3,
                )),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF00D4FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: const Color(0xFF00D4FF).withOpacity(0.3)),
                ),
                child: Text(e.type, style: const TextStyle(
                  fontSize: 10, fontWeight: FontWeight.w600,
                  color: Color(0xFF00D4FF),
                )),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Company — tappable
          GestureDetector(
            onTap: e.companyUrl != null
                ? () => openLink(e.companyUrl!)
                : null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(e.company, style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600,
                  color: Color(0xFF00D4FF),
                )),
                if (e.companyUrl != null) ...[
                  const SizedBox(width: 4),
                  const Icon(Icons.open_in_new_rounded,
                      size: 12, color: Color(0xFF00D4FF)),
                ],
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Duration
          Row(children: [
            Icon(Icons.calendar_today_outlined,
                size: 12, color: Colors.white.withOpacity(0.4)),
            const SizedBox(width: 5),
            Text(e.duration, style: TextStyle(
                fontSize: 12, color: Colors.white.withOpacity(0.5))),
          ]),
          const SizedBox(height: 4),

          // Location
          Row(children: [
            Icon(Icons.location_on_outlined,
                size: 12, color: Colors.white.withOpacity(0.4)),
            const SizedBox(width: 5),
            Expanded(child: Text(e.location, style: TextStyle(
                fontSize: 12, color: Colors.white.withOpacity(0.5)))),
          ]),

          const SizedBox(height: 14),
          Divider(color: Colors.white.withOpacity(0.07), thickness: 1),
          const SizedBox(height: 10),

          // Bullet points
          for (final point in e.points)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 7),
                    width: 4, height: 4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF00B4A0),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(point, style: TextStyle(
                    fontSize: 13, height: 1.6,
                    color: Colors.white.withOpacity(0.7),
                  ))),
                ],
              ),
            ),

          // Tech badges
          if (e.techUsed.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(spacing: 6, runSpacing: 6,
              children: [
                for (final tech in e.techUsed)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.12)),
                    ),
                    child: Text(tech, style: const TextStyle(
                      fontSize: 10, color: Color(0xFF7EC8E3),
                      fontWeight: FontWeight.w500,
                    )),
                  ),
              ],
            ),
          ],
        ],
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
      Icon(Icons.work_outline_rounded,
          size: 40, color: Colors.white.withOpacity(0.2)),
      const SizedBox(height: 14),
      Text("Experience coming soon —\nI'm still diving in! 🤿",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, height: 1.7,
            color: Colors.white.withOpacity(0.4))),
    ]),
  );
}
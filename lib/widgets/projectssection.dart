import 'package:flutter/material.dart';
import 'package:myportfolio/utils/projectutils.dart';
import 'package:myportfolio/widgets/projectcard.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      // Deep zone — darker ocean
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
          colors: [Color(0xFF1B5E8A), Color(0xFF0D3B60)],
        ),
      ),
      child: Column(
        children: [
          // ── Header ──
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: const Text("PROJECTS", style: TextStyle(
              fontSize: 10, letterSpacing: 3,
              color: Color(0xFF00D4FF), fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 16),
          const Text("Featured Work",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900,
              color: Colors.white, letterSpacing: -0.5)),
          const SizedBox(height: 10),
          Text("Things I've built while diving deeper",
            style: TextStyle(fontSize: 15,
                color: Colors.white.withOpacity(0.65))),
          const SizedBox(height: 56),

          // ── Fixed-width card grid ──
          // Cards are 280px wide — layout decides how many fit per row
          LayoutBuilder(
            builder: (context, constraints) {
              const cardWidth = 280.0;
              const spacing  = 20.0;
              final cols = ((constraints.maxWidth + spacing) ~/ (cardWidth + spacing))
                  .clamp(1, 4);
              final totalWidth = cols * cardWidth + (cols - 1) * spacing;

              return SizedBox(
                width: totalWidth.toDouble(),
                child: Wrap(
                  spacing: spacing,
                  runSpacing: spacing,
                  children: [
                    for (final p in projectUtils)
                      SizedBox(width: cardWidth, child: ProjectCard(project: p)),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _fade  = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.12), end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    WidgetsBinding.instance.addPostFrameCallback((_) => _ctrl.forward());
  }

  @override void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 88, horizontal: 48),
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4A90C4), Color(0xFF2C7AAE)],
        ),
      ),
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: Column(
            // ── Everything centered, just like Tech Stack ──
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // ── Tag ──
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: Colors.white.withOpacity(0.4)),
                ),
                child: const Text("ABOUT", style: TextStyle(
                  fontSize: 10, letterSpacing: 3,
                  color: Colors.white, fontWeight: FontWeight.w700,
                )),
              ),

              const SizedBox(height: 16),

              // ── Title ──
              const Text(
                "A bit about me",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 44, fontWeight: FontWeight.w900,
                  color: Colors.white, letterSpacing: -1, height: 1.1,
                ),
              ),

              const SizedBox(height: 12),

              // ── Subtitle ──
              Text(
                "CS undergraduate passionate about turning ideas into functional products.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.65),
                  height: 1.6,
                ),
              ),

              const SizedBox(height: 52),

              // ── Info rows — constrained width, left-aligned text ──
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: LayoutBuilder(
                  builder: (context, constraints) =>
                      constraints.maxWidth > 600
                          ? _WideInfoGrid()
                          : _NarrowInfoList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── 2x2 grid on desktop ──
class _WideInfoGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _InfoRow(
              icon: Icons.school_outlined,
              title: "CS Undergraduate",
              subtitle: "Building real-world applications and solving algorithmic problems.",
            )),
            SizedBox(width: 24),
            Expanded(child: _InfoRow(
              icon: Icons.code_outlined,
              title: "Full Stack + Flutter",
              subtitle: "Experience in C++ (DSA), web development, and cross-platform mobile apps.",
            )),
          ],
        ),
        const SizedBox(height: 28),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: _InfoRow(
              icon: Icons.psychology_outlined,
              title: "Exploring ML & Systems",
              subtitle: "Delving into machine learning and scalable system design patterns.",
            )),
            SizedBox(width: 24),
            Expanded(child: _InfoRow(
              icon: Icons.lightbulb_outlined,
              title: "Learning Mindset",
              subtitle: "Learning new things and contributing wherever I can.",
            )),
          ],
        ),
      ],
    );
  }
}

// ── Single column on mobile ──
class _NarrowInfoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _InfoRow(
          icon: Icons.school_outlined,
          title: "CS Undergraduate",
          subtitle: "Building real-world applications and solving algorithmic problems.",
        ),
        SizedBox(height: 22),
        _InfoRow(
          icon: Icons.code_outlined,
          title: "Full Stack + Flutter",
          subtitle: "C++, web, and mobile development.",
        ),
        SizedBox(height: 22),
        _InfoRow(
          icon: Icons.psychology_outlined,
          title: "Exploring ML",
          subtitle: "Machine learning & scalable systems.",
        ),
        SizedBox(height: 22),
        _InfoRow(
          icon: Icons.lightbulb_outlined,
          title: "Learning Mindset",
          subtitle: "I like learning new things and technologies.",
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _InfoRow({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
          ),
          child: Icon(icon, color: const Color(0xFF00D4FF), size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
              const SizedBox(height: 5),
              Text(subtitle, style: TextStyle(
                fontSize: 13, height: 1.6,
                color: Colors.white.withOpacity(0.65),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
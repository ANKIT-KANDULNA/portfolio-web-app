import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class About extends StatefulWidget {
  const About({super.key});
  @override State<About> createState() => _AboutState();
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
    // Shallow water — medium blue
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 88, horizontal: 48),
      width: double.maxFinite,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
          colors: [Color(0xFF4A90C4), Color(0xFF2C7AAE)],
        ),
      ),
      child: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: LayoutBuilder(
            builder: (context, constraints) => constraints.maxWidth > 720
                ? _WideLayout()
                : _NarrowLayout(),
          ),
        ),
      ),
    );
  }
}

class _WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(width: 260, child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTag("ABOUT"),
          const SizedBox(height: 18),
          const Text("A bit\nabout me",
            style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900,
              color: Colors.white, height: 1.1, letterSpacing: -1)),
          const SizedBox(height: 22),
          Container(width: 56, height: 4,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF00D4FF), Color(0xFF00B4A0)]),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 28),
          Text("CS undergraduate passionate about turning ideas into functional products.",
            style: TextStyle(fontSize: 14, height: 1.7,
                color: Colors.white.withOpacity(0.75))),
        ],
      )),
      const SizedBox(width: 64),
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _InfoRow(icon: Icons.school_outlined,
            title: "CS Undergraduate",
            subtitle: "Building real-world applications and solving algorithmic problems."),
          SizedBox(height: 22),
          _InfoRow(icon: Icons.code_outlined,
            title: "Full Stack + Flutter",
            subtitle: "Experience in C++ (DSA), web development, and cross-platform mobile apps."),
          SizedBox(height: 22),
          _InfoRow(icon: Icons.psychology_outlined,
            title: "Exploring ML & Systems",
            subtitle: "Delving into machine learning and scalable system design patterns."),
          SizedBox(height: 22),
          _InfoRow(icon: Icons.lightbulb_outlined,
            title: "Builder Mindset",
            subtitle: "Turning ideas into functional products, learning from others, and contributing wherever I can."),
        ],
      )),
    ],
  );
}

class _NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _SectionTag("ABOUT"),
      const SizedBox(height: 14),
      const Text("A bit about me",
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900,
          color: Colors.white, letterSpacing: -0.5)),
      const SizedBox(height: 32),
      const _InfoRow(icon: Icons.school_outlined, title: "CS Undergraduate",
          subtitle: "Building real-world applications."),
      const SizedBox(height: 18),
      const _InfoRow(icon: Icons.code_outlined, title: "Full Stack + Flutter",
          subtitle: "C++, web, and mobile development."),
      const SizedBox(height: 18),
      const _InfoRow(icon: Icons.psychology_outlined, title: "Exploring ML",
          subtitle: "Machine learning & scalable systems."),
      const SizedBox(height: 18),
      const _InfoRow(icon: Icons.lightbulb_outlined, title: "Builder Mindset",
          subtitle: "Turning ideas into functional products."),
    ],
  );
}

class _InfoRow extends StatelessWidget {
  final IconData icon; final String title; final String subtitle;
  const _InfoRow({required this.icon, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Row(
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
      const SizedBox(width: 16),
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 15,
              fontWeight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(fontSize: 14, height: 1.6,
              color: Colors.white.withOpacity(0.72))),
        ],
      )),
    ],
  );
}

class _SectionTag extends StatelessWidget {
  final String label;
  const _SectionTag(this.label);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: Colors.white.withOpacity(0.3)),
    ),
    child: Text(label, style: const TextStyle(
      fontSize: 10, letterSpacing: 3,
      color: Color(0xFF00D4FF), fontWeight: FontWeight.w700)),
  );
}
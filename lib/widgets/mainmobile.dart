import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});
  @override State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _floatCtrl;
  late Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();
    _floatCtrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
    _floatAnim = Tween<double>(begin: -8.0, end: 8.0)
        .animate(CurvedAnimation(parent: _floatCtrl, curve: Curves.easeInOut));
  }

  @override void dispose() { _floatCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 650),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF0F9FF),
            Color(0xFFB3D9F2),
            Color(0xFF4A90C4),
          ],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),

          AnimatedBuilder(
            animation: _floatAnim,
            builder: (_, child) => Transform.translate(
              offset: Offset(0, _floatAnim.value), child: child),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 230, height: 230,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(
                      color: const Color(0xFF1B5E8A).withOpacity(0.2),
                      blurRadius: 50, spreadRadius: 8,
                    )],
                  ),
                ),
                Container(width: 215, height: 215,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF1B5E8A).withOpacity(0.25), width: 1),
                  ),
                ),
                ClipOval(
                  child: Container(
                    width: 190, height: 190,
                    color: const Color(0xFFB3D9F2),
                    child: Image.asset("assets/whale.png", fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(
                          Icons.person, size: 60, color: CustomColor.deep)),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1B5E8A).withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: const Color(0xFF1B5E8A).withOpacity(0.3)),
            ),
            child: const Text("🌊  Dive deeper to explore",
              style: TextStyle(fontSize: 12, color: CustomColor.deep)),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: AnimatedTextKit(
              repeatForever: false,
              isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText(
                  "Hi, I'm\nAnkit Kandulna",
                  speed: const Duration(milliseconds: 75),
                  textAlign: TextAlign.center,
                  textStyle: const TextStyle(
                    fontSize: 38, height: 1.2, fontWeight: FontWeight.w900,
                    color: CustomColor.textOnLight, letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          ShaderMask(
            shaderCallback: (b) => const LinearGradient(
              colors: [Color(0xFF1B5E8A), Color(0xFF00B4A0)],
            ).createShader(b),
            child: const Text("Flutter Dev  ·  CS Undergrad",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white,
                  fontWeight: FontWeight.w600)),
          ),

          const SizedBox(height: 32),

          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1B5E8A), Color(0xFF00B4A0)]),
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(
                  color: const Color(0xFF1B5E8A).withOpacity(0.3),
                  blurRadius: 24,
                )],
              ),
              child: const Text("Dive In 🤿",
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w700, fontSize: 15)),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
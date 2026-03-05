import 'dart:math' as math;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class MainDesktop extends StatefulWidget {
  const MainDesktop({super.key});
  @override
  State<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends State<MainDesktop>
    with TickerProviderStateMixin {
  late AnimationController _waveCtrl;
  late AnimationController _floatCtrl;
  late AnimationController _fadeCtrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  late Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();
    _waveCtrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 8))..repeat();
    _floatCtrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 4))..repeat(reverse: true);
    _fadeCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1100))..forward();
    _fadeAnim  = CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero)
        .animate(CurvedAnimation(parent: _fadeCtrl, curve: Curves.easeOut));
    _floatAnim = Tween<double>(begin: -12.0, end: 12.0)
        .animate(CurvedAnimation(parent: _floatCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _waveCtrl.dispose(); _floatCtrl.dispose(); _fadeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      constraints: const BoxConstraints(minHeight: 620),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF0F9FF), // sky reflection
            Color(0xFFB3D9F2), // shallow water
            Color(0xFF4A90C4), // mid water — merges into About section
          ],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // ── Animated caustic light rays ──
          AnimatedBuilder(
            animation: _waveCtrl,
            builder: (_, __) => CustomPaint(
              painter: _OceanSurfacePainter(_waveCtrl.value),
              size: Size.infinite,
            ),
          ),

          // ── Sun shimmer orb top-right ──
          Positioned(
            right: -80, top: -80,
            child: Container(
              width: 400, height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Colors.white.withOpacity(0.25),
                  Colors.transparent,
                ]),
              ),
            ),
          ),

          // ── Main content ──
          FadeTransition(
            opacity: _fadeAnim,
            child: SlideTransition(
              position: _slideAnim,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Row(
                  children: [
                    // ── Left: text ──
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 80),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Badge("🌊  Dive deeper to explore"),
                            const SizedBox(height: 28),

                            AnimatedTextKit(
                              repeatForever: false,
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  "Hi, I'm\nAnkit Kandulna",
                                  speed: const Duration(milliseconds: 75),
                                  textStyle: const TextStyle(
                                    fontSize: 60,
                                    height: 1.12,
                                    fontWeight: FontWeight.w900,
                                    color: CustomColor.textOnLight,
                                    letterSpacing: -1.5,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),

                            ShaderMask(
                              shaderCallback: (b) => const LinearGradient(
                                colors: [Color(0xFF1B5E8A), Color(0xFF00B4A0)],
                              ).createShader(b),
                              child: const Text(
                                "Software Developer  ·  CS Undergraduate  ·  Builder",
                                style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600,
                                  color: Colors.white, letterSpacing: 0.4,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            const Text(
                              "The deeper you explore, the more you discover.\nScroll down to dive into my world.",
                              style: TextStyle(
                                fontSize: 15,
                                color: CustomColor.textSubOnLight,
                                height: 1.8,
                              ),
                            ),
                            const SizedBox(height: 40),

                            Row(
                              children: [
                                _GlowButton(label: "Dive In 🤿", onTap: () {}),
                                const SizedBox(width: 14),
                                _OutlineButton(label: "Say Hi 👋", onTap: () {}),
                              ],
                            ),
                            const SizedBox(height: 40),

                          ],
                        ),
                      ),
                    ),

                    // ── Right: floating avatar ──
                    Expanded(
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _floatAnim,
                          builder: (_, child) => Transform.translate(
                            offset: Offset(0, _floatAnim.value), child: child),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Ripple rings
                              _RippleRing(size: 380, opacity: 0.08, ctrl: _waveCtrl),
                              _RippleRing(size: 320, opacity: 0.14, ctrl: _waveCtrl, phase: 0.33),
                              // Glow border
                              Container(
                                width: 280, height: 280,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF1B5E8A).withOpacity(0.4),
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFF00D4FF).withOpacity(0.2),
                                      blurRadius: 50, spreadRadius: 4,
                                    ),
                                  ],
                                ),
                              ),
                              ClipOval(
                                child: Container(
                                  width: 255, height: 255,
                                  color: const Color(0xFFB3D9F2),
                                  child: Image.asset("whale.png",
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => const Icon(
                                      Icons.person, size: 80,
                                      color: CustomColor.deep,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Scroll indicator ──
          Positioned(
            bottom: 28, left: 0, right: 0,
            child: FadeTransition(
              opacity: _fadeAnim,
              child: const _ScrollIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Ripple ring widget ──
class _RippleRing extends StatelessWidget {
  final double size;
  final double opacity;
  final AnimationController ctrl;
  final double phase;
  const _RippleRing({
    required this.size, required this.opacity,
    required this.ctrl, this.phase = 0,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ctrl,
      builder: (_, __) {
        final t = ((ctrl.value + phase) % 1.0);
        final scale = 0.85 + t * 0.15;
        return Transform.scale(
          scale: scale,
          child: Container(
            width: size, height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF1B5E8A).withOpacity(opacity * (1 - t)),
                width: 1.5,
              ),
            ),
          ),
        );
      },
    );
  }
}

// ── Buttons ──
class _Badge extends StatelessWidget {
  final String label;
  const _Badge(this.label);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: const Color(0xFF1B5E8A).withOpacity(0.1),
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: const Color(0xFF1B5E8A).withOpacity(0.3)),
    ),
    child: Text(label,
      style: const TextStyle(fontSize: 13, color: CustomColor.deep, letterSpacing: 0.5)),
  );
}

class _GlowButton extends StatefulWidget {
  final String label; final VoidCallback onTap;
  const _GlowButton({required this.label, required this.onTap});
  @override State<_GlowButton> createState() => _GlowButtonState();
}
class _GlowButtonState extends State<_GlowButton> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1B5E8A), Color(0xFF00B4A0)]),
          borderRadius: BorderRadius.circular(50),
          boxShadow: _h ? [BoxShadow(
            color: const Color(0xFF1B5E8A).withOpacity(0.4),
            blurRadius: 28,
          )] : [],
        ),
        child: Text(widget.label,
          style: const TextStyle(color: Colors.white,
              fontWeight: FontWeight.w700, fontSize: 14)),
      ),
    ),
  );
}

class _OutlineButton extends StatefulWidget {
  final String label; final VoidCallback onTap;
  const _OutlineButton({required this.label, required this.onTap});
  @override State<_OutlineButton> createState() => _OutlineButtonState();
}
class _OutlineButtonState extends State<_OutlineButton> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        decoration: BoxDecoration(
          color: _h ? const Color(0xFF1B5E8A).withOpacity(0.08) : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: _h ? const Color(0xFF1B5E8A).withOpacity(0.7)
                      : const Color(0xFF1B5E8A).withOpacity(0.35),
            width: 1.5,
          ),
        ),
        child: Text(widget.label,
          style: TextStyle(
            color: _h ? CustomColor.deep : CustomColor.textSubOnLight,
            fontWeight: FontWeight.w600, fontSize: 14,
          )),
      ),
    ),
  );
}

class _TechBadge extends StatelessWidget {
  final String label;
  const _TechBadge(this.label);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.55),
      borderRadius: BorderRadius.circular(6),
      border: Border.all(color: CustomColor.borderOnLight),
    ),
    child: Text(label,
      style: const TextStyle(fontSize: 11, color: CustomColor.deep,
          letterSpacing: 0.5, fontWeight: FontWeight.w600)),
  );
}

class _ScrollIndicator extends StatefulWidget {
  const _ScrollIndicator();
  @override State<_ScrollIndicator> createState() => _ScrollIndicatorState();
}
class _ScrollIndicatorState extends State<_ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _c;
  late Animation<double> _a;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1100))
      ..repeat(reverse: true);
    _a = CurvedAnimation(parent: _c, curve: Curves.easeInOut);
  }
  @override void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text("SCROLL DOWN", style: TextStyle(
        fontSize: 9, letterSpacing: 4, color: CustomColor.deep)),
      const SizedBox(height: 6),
      FadeTransition(opacity: _a,
        child: const Icon(Icons.keyboard_arrow_down_rounded,
            color: CustomColor.deep, size: 22)),
    ],
  );
}

// ── Caustic light painter ──
class _OceanSurfacePainter extends CustomPainter {
  final double t;
  static final _rng = math.Random(7);
  static final _rays = List.generate(18, (_) => _Ray(
    x: _rng.nextDouble(),
    speed: _rng.nextDouble() * 0.15 + 0.04,
    width: _rng.nextDouble() * 80 + 30,
    opacity: _rng.nextDouble() * 0.06 + 0.02,
  ));
  const _OceanSurfacePainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    for (final r in _rays) {
      final dx = math.sin((t + r.x) * 2 * math.pi) * 40;
      final paint = Paint()
        ..color = Colors.white.withOpacity(r.opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(r.x * size.width + dx, size.height * 0.15),
          width: r.width, height: size.height * 0.7,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_OceanSurfacePainter old) => old.t != t;
}

class _Ray {
  final double x, speed, width, opacity;
  const _Ray({required this.x, required this.speed,
      required this.width, required this.opacity});
}
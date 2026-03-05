import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myportfolio/constants/size.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myportfolio/utils/open_link.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});
  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();
  final _messageCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _messageCtrl.dispose();
    super.dispose();
  }

  static const _socials = [
    {
      'img': 'assets/icons/leetcode-original.svg',   
      'label': 'LeetCode',     
      'url': 'https://leetcode.com/u/ANKIT_KANDULNA/'
    },
    {
      'img': 'assets/icons/codeforces.svg', 
      'label': 'Codeforces',   
      'url': 'https://codeforces.com/profile/ankitkandulna1022'
    },
    {
      'img': 'assets/icons/codechef.svg',   
      'label': 'CodeChef',     
      'url': 'https://www.codechef.com/users/ankitkandulna'
    },
    {
      'img': 'assets/icons/codingninjas.svg',     
      'label': 'Code360',      
      'url': 'https://www.naukri.com/code360/profile/ankitbadmosh'
    },
    {
      'img': 'assets/icons/geeksforgeeks.svg',        
      'label': 'GeeksForGeeks',
      'url': 'https://www.geeksforgeeks.org/profile/ankitkandulna'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 88, horizontal: 40),
      color: const Color(0xFF0A2744),
      child: Column(
        children: [
          // ── Tag ──
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF00D4FF).withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFF00D4FF).withOpacity(0.35)),
            ),
            child: const Text("CONTACT", style: TextStyle(
              fontSize: 10, letterSpacing: 3,
              color: Color(0xFF00D4FF), fontWeight: FontWeight.w700,
            )),
          ),
          const SizedBox(height: 16),
          const Text("Let's Work Together",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900,
              color: Colors.white, letterSpacing: -0.5)),
          const SizedBox(height: 12),
          Text("Have a project in mind? I'd love to hear about it.",
            style: TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.6))),
          const SizedBox(height: 60),

          // ── Form ──
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 620),
            child: Column(
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  final wide = constraints.maxWidth >= kMinDestopWidth;
                  final nameField  = _Field(ctrl: _nameCtrl,    label: "Your Name",      icon: Icons.person_outline_rounded);
                  final emailField = _Field(ctrl: _emailCtrl,   label: "Email Address",  icon: Icons.email_outlined);
                  return wide
                      ? Row(children: [
                          Expanded(child: nameField),
                          const SizedBox(width: 16),
                          Expanded(child: emailField),
                        ])
                      : Column(children: [
                          nameField,
                          const SizedBox(height: 14),
                          emailField,
                        ]);
                }),
                const SizedBox(height: 16),
                _Field(ctrl: _messageCtrl, label: "Your Message",
                    icon: Icons.chat_bubble_outline_rounded, maxLines: 6),
                const SizedBox(height: 28),
                _SendButton(onTap: () {}),
              ],
            ),
          ),

          const SizedBox(height: 64),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 320),
            child: Divider(color: Colors.white.withOpacity(0.12), thickness: 1),
          ),
          const SizedBox(height: 40),

          const Text("Find Me Online",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,
              color: Colors.white, letterSpacing: -0.3)),
          const SizedBox(height: 8),
          Text("Competitive Programming",
            style: TextStyle(fontSize: 13, color: Colors.white.withOpacity(0.5))),
          const SizedBox(height: 32),

          Wrap(
            spacing: 14, runSpacing: 14,
            alignment: WrapAlignment.center,
            children: [
              for (final s in _socials)
                _SocialIcon(imgPath: s['img']!, label: s['label']!, url: s['url']!),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Text field — dark background, light text ──
class _Field extends StatefulWidget {
  final TextEditingController ctrl;
  final String label;
  final IconData icon;
  final int maxLines;
  const _Field({required this.ctrl, required this.label,
      required this.icon, this.maxLines = 1});
  @override State<_Field> createState() => _FieldState();
}

class _FieldState extends State<_Field> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (f) => setState(() => _focused = f),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          // Dark card — NOT white
          color: const Color(0xFF0D3358),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _focused
                ? const Color(0xFF00D4FF).withOpacity(0.7)
                : Colors.white.withOpacity(0.12),
            width: 1.5,
          ),
          boxShadow: _focused ? [BoxShadow(
            color: const Color(0xFF00D4FF).withOpacity(0.12),
            blurRadius: 20,
          )] : [],
        ),
        child: TextField(
          controller: widget.ctrl,
          maxLines: widget.maxLines,
          // Visible white text
          style: const TextStyle(color: Colors.white, fontSize: 14),
          cursorColor: const Color(0xFF00D4FF),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: TextStyle(
                color: Colors.white.withOpacity(0.45), fontSize: 13),
            floatingLabelStyle: const TextStyle(
                color: Color(0xFF00D4FF), fontSize: 12),
            prefixIcon: Icon(widget.icon, size: 18,
              color: _focused
                  ? const Color(0xFF00D4FF)
                  : Colors.white.withOpacity(0.35)),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}

class _SendButton extends StatefulWidget {
  final VoidCallback onTap;
  const _SendButton({required this.onTap});
  @override State<_SendButton> createState() => _SendButtonState();
}
class _SendButtonState extends State<_SendButton> {
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
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: _h
              ? [const Color(0xFF00FFCC), const Color(0xFF00B4D8)]
              : [const Color(0xFF00D4FF), const Color(0xFF0080CC)]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: _h ? [BoxShadow(
            color: const Color(0xFF00D4FF).withOpacity(0.4), blurRadius: 30)] : [],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.send_rounded, color: Colors.black, size: 17),
            SizedBox(width: 8),
            Text("Send Message", style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700,
              fontSize: 15, letterSpacing: 0.5)),
          ],
        ),
      ),
    ),
  );
}

class _SocialIcon extends StatefulWidget {
  final String imgPath, label, url;
  const _SocialIcon({required this.imgPath, required this.label, required this.url});
  @override State<_SocialIcon> createState() => _SocialIconState();
}
class _SocialIconState extends State<_SocialIcon>
    with SingleTickerProviderStateMixin {
  bool _h = false;
  late AnimationController _ctrl;
  late Animation<double> _scale;
  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this,
        duration: const Duration(milliseconds: 180));
    _scale = Tween<double>(begin: 1.0, end: 1.15)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
  }
  @override void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) { setState(() => _h = true);  _ctrl.forward(); },
    onExit:  (_) { setState(() => _h = false); _ctrl.reverse(); },
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () => openLink(widget.url),
      child: ScaleTransition(
        scale: _scale,
        child: Tooltip(
          message: widget.label,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _h
                  ? const Color(0xFF00D4FF).withOpacity(0.1)
                  : const Color(0xFF0D3358),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: _h
                    ? const Color(0xFF00D4FF).withOpacity(0.5)
                    : Colors.white.withOpacity(0.1),
                width: 1.5,
              ),
              boxShadow: _h ? [BoxShadow(
                color: const Color(0xFF00D4FF).withOpacity(0.2),
                blurRadius: 20)] : [],
            ),
            child: SvgPicture.asset(widget.imgPath, width: 32, height: 32,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(
                  Icons.link, size: 28, color: Colors.white54)),
          ),
        ),
      ),
    ),
  );
}
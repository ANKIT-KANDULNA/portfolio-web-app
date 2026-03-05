import 'dart:js_interop_unsafe';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myportfolio/utils/open_link.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  static const _socials = [
    {
      'label': 'GitHub', 
      'url': 'https://github.com/ANKIT-KANDULNA',                        
      'img': 'assets/icons/github.svg'
    },
    {
      'label': 'LinkedIn',   
      'url': 'https://www.linkedin.com/in/ankit-kandulna-304b36285/',    
      'img': 'assets/icons/linkedin-original.svg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 40),
      // Trench — absolute deepest
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
          colors: [Color(0xFF041624), Color(0xFF020C14)],
        ),
        border: Border(top: BorderSide(color: Color(0x1A00D4FF), width: 1)),
      ),
      child: Column(
        children: [
          // Depth indicator
          const Text("— You've reached the ocean floor —",
            style: TextStyle(
              fontSize: 11, letterSpacing: 2,
              color: Color(0xFF00D4FF), fontWeight: FontWeight.w500)),
          const SizedBox(height: 32),

          // Social links
          Wrap(
            spacing: 10, runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (final s in _socials)
                _FooterLink(
                  label: s['label']!, url: s['url']!, img: s['img']!),
            ],
          ),

          const SizedBox(height: 32),

          const Divider(color: Color(0x1A00D4FF), thickness: 1),
          const SizedBox(height: 24),

          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(children: [
              TextSpan(text: 'Built with ', style: TextStyle(
                  color: Color(0xFF4A90C4), fontSize: 13)),
              TextSpan(text: '♥  Flutter', style: TextStyle(
                  color: Color(0xFF00D4FF), fontSize: 13,
                  fontWeight: FontWeight.w600)),
              TextSpan(text: '  ·  Designed & developed by ',
                  style: TextStyle(color: Color(0xFF4A90C4), fontSize: 13)),
              TextSpan(text: 'Ankit Kandulna', style: TextStyle(
                  color: Colors.white, fontSize: 13,
                  fontWeight: FontWeight.w600)),
            ]),
          ),
          const SizedBox(height: 8),
          const Text('© 2026 All rights reserved',
            style: TextStyle(color: Color(0xFF2C5F8A), fontSize: 12)),
        ],
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label, url, img;
  const _FooterLink({required this.label, required this.url, required this.img});
  @override State<_FooterLink> createState() => _FooterLinkState();
}
class _FooterLinkState extends State<_FooterLink> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _h = true),
    onExit:  (_) => setState(() => _h = false),
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () => openLink(widget.url),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: _h ? const Color(0xFF00D4FF).withOpacity(0.08) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _h ? const Color(0xFF00D4FF).withOpacity(0.4)
                      : const Color(0x1A00D4FF),
          ),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          SvgPicture.asset(widget.img, width: 16, height: 16,
            errorBuilder: (_, __, ___) => Icon(Icons.open_in_new_rounded,
                size: 14,
                color: _h ? const Color(0xFF00D4FF) : const Color(0xFF4A90C4))),
          const SizedBox(width: 8),
          Text(widget.label, style: TextStyle(fontSize: 13,
            color: _h ? const Color(0xFF00D4FF) : const Color(0xFF4A90C4),
            fontWeight: FontWeight.w500)),
        ]),
      ),
    ),
  );
}
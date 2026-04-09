import 'package:flutter/material.dart';
import 'package:myportfolio/constants/size.dart';
import 'package:myportfolio/widgets/about.dart';
import 'package:myportfolio/widgets/contactsection.dart';
import 'package:myportfolio/widgets/drawermobile.dart';
import 'package:myportfolio/widgets/educationmobile.dart';
import 'package:myportfolio/widgets/educationsection.dart';
import 'package:myportfolio/widgets/experiencemobile.dart';
import 'package:myportfolio/widgets/experiencesection.dart';
import 'package:myportfolio/widgets/footer.dart';
import 'package:myportfolio/widgets/headerdesktop.dart';
import 'package:myportfolio/widgets/headermobile.dart';
import 'package:myportfolio/widgets/maindesktop.dart';
import 'package:myportfolio/widgets/mainmobile.dart';
import 'package:myportfolio/widgets/projectssection.dart';
import 'package:myportfolio/widgets/skillsdesktop.dart';
import 'package:myportfolio/widgets/skillsmobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollCtrl  = ScrollController();
  final List<GlobalKey> _keys = List.generate(7, (_) => GlobalKey());
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(() {
      final scrolled = _scrollCtrl.offset > 80;
      if (scrolled != _isScrolled) setState(() => _isScrolled = scrolled);
    });
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  void _scrollTo(int i) {
    final ctx = _keys[i].currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth >= kMinDestopWidth;
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFF0F9FF),
        endDrawer: isDesktop
            ? null
            : DrawerMobile(
                onNavItemTap: (i) {
                  _scaffoldKey.currentState?.closeEndDrawer();
                  _scrollTo(i);
                },
              ),
        body: Stack(children: [
          SingleChildScrollView(
            controller: _scrollCtrl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // 0 ── Home (surface)
                SizedBox(key: _keys[0]),
                if (isDesktop) const MainDesktop() else const MainMobile(),

                // 1 ── About (shallow)
                About(key: _keys[1]),

                // 2 ── Skills (mid water)
                Container(
                  key: _keys[2],
                  padding: const EdgeInsets.fromLTRB(40, 80, 40, 88),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF2C7AAE), Color(0xFF1B5E8A)],
                    ),
                  ),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.2)),
                      ),
                      child: const Text("SKILLS", style: TextStyle(
                        fontSize: 10, letterSpacing: 3,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                    const SizedBox(height: 16),
                    const Text("Tech Stack", style: TextStyle(
                        fontSize: 40, fontWeight: FontWeight.w900,
                        color: Colors.white, letterSpacing: -0.5)),
                    const SizedBox(height: 8),
                    Text("Tools I swim with daily",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white.withOpacity(0.6))),
                    const SizedBox(height: 48),
                    if (constraints.maxWidth >= kMedDestopWidth)
                      const SkillsDesktop()
                    else
                      const SkillsMobile(),
                  ]),
                ),

                // 3 ── Experience
                if (constraints.maxWidth >= kMinDestopWidth)
                  ExperienceSection(key: _keys[3])
                else
                  ExperienceMobile(key: _keys[3]),

                // 4 ── Projects
                ProjectsSection(key: _keys[4]),

                // 5 ── Education
                if (constraints.maxWidth >= kMinDestopWidth)
                  EducationSection(key: _keys[5])
                else
                  EducationMobile(key: _keys[5]),

                // 6 ── Contact
                ContactSection(key: _keys[6]),

                const Footer(),
              ],
            ),
          ),

          // ── Floating header ──
          Positioned(
            top: 0, left: 0, right: 0,
            child: isDesktop
                ? HeaderDesktop(
                    isScrolled: _isScrolled,
                    onNavMenuTap: _scrollTo,
                  )
                : HeaderMobile(
                    isScrolled: _isScrolled,
                    onLogoTap: () => _scrollTo(0),
                    onMenuTap: () =>
                        _scaffoldKey.currentState?.openEndDrawer(),
                  ),
          ),
        ]),
      );
    });
  }
}
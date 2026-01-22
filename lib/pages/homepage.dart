import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/nav_items.dart';
import 'package:myportfolio/constants/size.dart';
import 'package:myportfolio/constants/skillitems.dart';
import 'package:myportfolio/styles/style.dart';
import 'package:myportfolio/utils/projectutils.dart';
import 'package:myportfolio/widgets/about.dart';
import 'package:myportfolio/widgets/contactsection.dart';
import 'package:myportfolio/widgets/customtextfield.dart';
import 'package:myportfolio/widgets/drawermobile.dart';
import 'package:myportfolio/widgets/footer.dart';
import 'package:myportfolio/widgets/headerdesktop.dart';
import 'package:myportfolio/widgets/headermobile.dart';
import 'package:myportfolio/widgets/maindesktop.dart';
import 'package:myportfolio/widgets/mainmobile.dart';
import 'package:myportfolio/widgets/projectcard.dart';
import 'package:myportfolio/widgets/projectssection.dart';
import 'package:myportfolio/widgets/sitelogo.dart';
import 'package:myportfolio/widgets/skillsdesktop.dart';
import 'package:myportfolio/widgets/skillsmobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();

  final List<GlobalKey> navBarKeys = List.generate(5, (index)=>GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.blue[900],
          endDrawer: constraints.maxWidth >= kMinDestopWidth ? null :  DrawerMobile(
            onNavItemTap: (int navIndex){
              scaffoldKey.currentState?.closeEndDrawer();
              scrollToSection(navIndex);
            },
          ),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(key: navBarKeys[0],),
                // MAIN
                if(constraints.maxWidth >= kMinDestopWidth)
                  HeaderDesktop(onNavMenuTap: (int navIndex){
                    scrollToSection(navIndex);
                  },)
                
                else
                  HeaderMobile(
                    onLogoTap: () {},
                    onMenuTap: () {
                      scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
            
                if(constraints.maxWidth >= kMinDestopWidth)
                  const MainDesktop()
                
                else
                  const MainMobile(),

      
                //ABOUT
                About(key: navBarKeys[1],),
            
                // SKILLS
                Container(
                  key: navBarKeys[2],
                  // height: 500,
                  width: screenWidth,
                  padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                  color: CustomColor.level3,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Skills i have learned:", style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1a2a4a),
                        ),
                      ),
            
                      const SizedBox(height: 50,),
            
                      if(constraints.maxWidth >= kMedDestopWidth)
                        const SkillsDesktop()
                      else
                        const SkillsMobile(),
                    ],
                  ),
                ),
                
                ProjectsSection(key: navBarKeys[3],),
                    
                // CONTACTS
                ContactSection(key: navBarKeys[4]),
                    
                // FOOTER
                Footer(),
              ],
            ),
          ),
        );
      }
    );
  }

  void scrollToSection(int navIndex){
    final key = navBarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.easeInOut
    );
  }
}
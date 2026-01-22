import 'package:flutter/material.dart';
import 'package:myportfolio/constants/nav_items.dart';
import 'package:myportfolio/styles/style.dart';
import 'package:myportfolio/widgets/sitelogo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key, required this.onNavMenuTap});
  final Function(int) onNavMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 90,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: double.maxFinite,
            decoration: kHeaderDecoration,
            child: Row(
              children: [
                SiteLogo(onTap: (){
                  
                },),
                const Spacer(),
                for(int i = 0; i < navTitles.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: TextButton(
                      onPressed: () {
                        onNavMenuTap(i);
                      }, 
                      child: Text(
                        navTitles[i],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
  }
}
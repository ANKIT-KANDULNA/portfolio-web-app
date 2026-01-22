import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/utils/projectutils.dart';
import 'package:myportfolio/widgets/projectcard.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
                padding: EdgeInsets.fromLTRB(5, 20, 25, 60),
                width: screenWidth,
                color: CustomColor.level4,
                child: Column(
                  children: [
                    const Text("Projects:", style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A2332),
                      ),
                    ),

                    const SizedBox(height: 50,),
                    // PROJECTS
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 800,
                      ),
                      child: Wrap(
                        spacing: 25,
                        runSpacing: 25,
                        children: [
                          for(int i = 0; i < projectUtils.length; i++)
                          ProjectCard(project: projectUtils[i]),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}
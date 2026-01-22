import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/utils/projectutils.dart';

import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String url) async{
  final Uri uri = Uri.parse(url);

  if(!await launchUrl(uri, mode: LaunchMode.externalApplication,
  )){
    throw 'Could not launch $url';
  }
}


class ProjectCard extends StatelessWidget {
  final ProjectUtils project;
  const ProjectCard({
    super.key, 
    required this.project,
  });

  @override
  Widget build(BuildContext context) {


    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
                
                child: Column(
                  children: [

                    Container(
                      clipBehavior: Clip.antiAlias,

                      height: 280,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: CustomColor.level3,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("assets/projects/02.png", 
                            height: 140,
                            width: 250,
                            fit: BoxFit.cover,
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                            child: Text(project.title, style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xFF1A2332),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                            child: Text(project.subtitle, style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),

                          Container(
                            color: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                            child: Row(
                              children: [
                                Text("Link:", style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),

                                const SizedBox(width: 5,),
                                if(project.androidLink != null)
                                InkWell(
                                  onTap: () {
                                    if(project.androidLink != null){
                                      openLink(project.androidLink!);
                                    }
                                  },
                                  child: Image.asset("assets/android.png", width: 18,),
                                  ),

                                if(project.iosLink != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: InkWell(
                                    onTap: () {
                                      if(project.iosLink != null){
                                        openLink(project.androidLink!);
                                      }
                                    },
                                    child: Image.asset("assets/ios.png", width: 18,),
                                    ),
                                ),

                                if(project.webLink != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: InkWell(
                                    onTap: () {
                                      if(project.webLink != null){
                                        openLink(project.webLink!);
                                      }
                                    },
                                    child: Image.asset("assets/web.png", width: 18,),
                                    ),
                                ),

                                if(project.githubLink != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: InkWell(
                                    onTap: () {
                                      if(project.githubLink != null){
                                        openLink(project.githubLink!);
                                      }
                                    },
                                    child: Image.asset("assets/github.png", width: 18,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
}
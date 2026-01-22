import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/size.dart';
import 'package:myportfolio/widgets/customtextfield.dart';

import 'dart:js_interop_unsafe';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String url) async{
  final Uri uri = Uri.parse(url);

  if(!await launchUrl(uri, mode: LaunchMode.externalApplication,
  )){
    throw 'Could not launch $url';
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                color: CustomColor.level5,
                child: Column(
                  children: [
                    const Text("Start a Conversation",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.level2,
                      ),
                    ),

                    const SizedBox(height: 50,),

                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 720,
                        maxHeight: 108,
                      ),
                      child: LayoutBuilder(builder: (context, constraints){
                        if(constraints.maxWidth >= kMinDestopWidth){
                          return buildNameEmailFeildDesktop();
                        }
                        return buildNameEmailFeildMobile();
                      },),
                    ),

                    SizedBox(height: 50,),

                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 720,
                      ),
                      child: CustomTextField(hintText: "Your Message", maxLines: 9,),
                    ),

                    const SizedBox(height: 20,),

                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 720,
                      ),
                      child: SizedBox(
                        width: double.maxFinite,
                        child: ElevatedButton(
                          onPressed: (){}, 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColor.level3,
                            foregroundColor: Colors.blue[900],
                          ),
                          child: Text("Send"),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30,),

                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 300,
                      ),
                      child: Divider(color: Colors.blue[100],),
                    ),

                    const SizedBox(height: 15,),

                    Text("My Other Profiles:", 
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.blue[100],
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            openLink("https://github.com/ANKIT-KANDULNA");
                          },
                          child: Image.asset("assets/github.png", width: 36,),
                        ),
                        InkWell(
                          onTap: () {
                            openLink("https://www.linkedin.com/in/ankit-kandulna-304b36285/");
                          },
                          child: Image.asset("assets/linkedin.png", width: 50,),
                        ),
                        InkWell(
                          onTap: () {
                            openLink("https://leetcode.com/u/ANKIT_KANDULNA/");
                          },
                          child: Image.asset("assets/leetcode.png", width: 45,),
                        ),
                        InkWell(
                          onTap: () {
                            openLink("https://codeforces.com/profile/ankitkandulna1022");
                          },
                          child: Image.asset("assets/codeforces.png", width: 36,),
                        ),
                        InkWell(
                          onTap: () {
                            openLink("https://www.codechef.com/users/ankitkandulna");
                          },
                          child: Image.asset("assets/codechef.png", width: 36,),
                        ),
                        InkWell(
                          onTap: () {
                            openLink("https://www.naukri.com/code360/profile/ankitbadmosh");
                          },
                          child: Image.asset("assets/naukri.png", width: 36,),
                        ),
                        InkWell(
                          onTap: () {
                            openLink("https://www.geeksforgeeks.org/profile/ankitkandulna");
                          },
                          child: Image.asset("assets/gfg.png", width: 36,),
                        ),
                      ],
                    ),
                  ],
                ),
              );
  }
  Row buildNameEmailFeildDesktop(){
    return Row(
                        children: [
                          Flexible(
                            child: CustomTextField(hintText: "Your Name",),
                          ),
                      
                          SizedBox(width: 50,),
                      
                          Flexible(
                            child: CustomTextField(hintText: "Your E-mail",),
                          ),
                        ],
                      );
  }
  Column buildNameEmailFeildMobile(){
    return Column(
                        children: [
                          Flexible(
                            child: CustomTextField(hintText: "Your Name",),
                          ),
                      
                          SizedBox(height: 15,),
                      
                          Flexible(
                            child: CustomTextField(hintText: "Your E-mail",),
                          ),
                        ],
                      );
  }
}
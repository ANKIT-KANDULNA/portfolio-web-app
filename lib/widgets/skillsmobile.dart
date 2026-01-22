import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/constants/skillitems.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 500,
      ),
      child: Column(
                        children: [
                          for(int i = 0; i < platformItems.length; i++)
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              width: 270,
                              decoration: BoxDecoration(
                                color: CustomColor.level2,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                leading: Image.asset(platformItems[i]["img"], width: 26,),
                                title: Text(platformItems[i]["title"], style: TextStyle(
                                  color: Color(0xFF1a2a4a),
                                ),),
                              ),
                            ),
                          
      
                          const SizedBox(height: 50,),
      
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                              for(int i = 0; i < skillItems.length; i++)
                                Chip(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                  backgroundColor: CustomColor.level2,
                                  label: Text(skillItems[i]["title"], style: TextStyle(
                                    color: Color(0xFF1a2a4a),
                                  ),), 
                                  avatar: Image.asset(skillItems[i]["img"]),
                                ),
                            ],
                          ),
                        ],
                      ),
    );
  }
}
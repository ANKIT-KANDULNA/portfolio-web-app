import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
                height: screenHeight,
                constraints: BoxConstraints(minHeight: 560, ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                        "assets/whale.png", 
                        width: screenWidth, 
                        height: screenHeight/2,
                      ),

                    const SizedBox(height: 30,),

                    AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "Hey guys,\nI'm Ankit Kandulna,\nAn Upcoming Developer",
                              speed: const Duration(milliseconds: 90),
                              textStyle: const TextStyle(
                                fontSize: 30,
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 15,),

                        SizedBox(
                          width: 270,
                          child: ElevatedButton(
                            onPressed: (){}, 
                            child: const Text("Say hi"),
                          ),
                        ),
                    const Text("C'mon baby don't say be maybe"),
                    const SizedBox(height: 180,),
                  ],
                ),
              );
  }
}
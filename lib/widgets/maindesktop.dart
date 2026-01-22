import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: screenHeight/1.2,
                constraints: const BoxConstraints(minHeight: 350),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      ],
                    ),
                    Image.asset(
                      "assets/whale.png",
                      width: screenWidth / 2,
                    ),
                  ],
                ),
              );
  }
}
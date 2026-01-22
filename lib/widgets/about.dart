import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding: const EdgeInsets.all(36),
                  width: double.maxFinite,
                  color: CustomColor.level2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.level6,
                          letterSpacing: 1.2,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Container(
                        width: 900, // keeps text readable on large screens
                        child: Text(
                          "I'm a Computer Science undergraduate who enjoys building real-world applications and solving algorithmic problems.\n\n"
                          "I have some experience in C++(DSA), Full Stack Development and App Development.\n\n"
                          "I'm exploring machine learning and scalable system design.\n\n"
                          "I like turning ideas into functional products, learning from others, and contributing wherever I can.",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.6, // line spacing
                            fontWeight: FontWeight.w400,
                            color: CustomColor.level6,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
  }
}
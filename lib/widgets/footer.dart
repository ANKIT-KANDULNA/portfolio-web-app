import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 90,
                width: double.maxFinite,
                color: CustomColor.level6,
                alignment: Alignment.center,
                child: const Text("Made by Ankit Kandulna", style: TextStyle( color: Colors.white),),
              );
  }
}
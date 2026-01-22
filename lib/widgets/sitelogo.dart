import 'package:flutter/material.dart';

class SiteLogo extends StatelessWidget {
  const SiteLogo({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'Ankit Kandulna', 
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.white,
                      // decoration: TextDecoration.underline,
                    ),
                  
                  ),
                );
  }
}
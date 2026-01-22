import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.controller, this.maxLines = 1, this.hintText,});
  final TextEditingController? controller;
  final int? maxLines;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,

                            style: TextStyle(
                              color: Colors.blue[900],
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(16),
                              filled: true,
                              fillColor: Colors.blue[100],
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              hintText: hintText,
                              hintStyle: TextStyle(
                                color: Colors.blue[900],
                              ),
                            ),
                          );
  }
}
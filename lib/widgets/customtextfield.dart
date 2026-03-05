import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final int maxLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _focused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (f) => setState(() => _focused = f),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: CustomColor.bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _focused
                ? CustomColor.accentCyan.withOpacity(0.6)
                : CustomColor.glassBorder,
            width: 1.5,
          ),
          boxShadow: _focused
              ? [
                  BoxShadow(
                    color: CustomColor.accentCyan.withOpacity(0.1),
                    blurRadius: 20,
                  ),
                ]
              : [],
        ),
        child: TextField(
          controller: widget.controller,
          maxLines: widget.maxLines,
          style: const TextStyle(
              color: CustomColor.textPrimary, fontSize: 14),
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle:
                const TextStyle(color: CustomColor.textMuted, fontSize: 13),
            floatingLabelStyle: const TextStyle(
              color: CustomColor.accentCyan,
              fontSize: 12,
            ),
            prefixIcon: widget.icon != null
                ? Icon(widget.icon,
                    color: _focused
                        ? CustomColor.accentCyan
                        : CustomColor.textMuted,
                    size: 18)
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
      ),
    );
  }
}
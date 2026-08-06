import 'package:flutter/material.dart';

class ArrowButton extends StatefulWidget {
  const ArrowButton({super.key, required this.text, required this.function, this.white = false});

  final String text;
  final Function function;
  final bool white;

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => {widget.function()},
      style: OutlinedButton.styleFrom(
        foregroundColor: widget.white ? Colors.white : const Color(0xFF0F382C),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        side: BorderSide(color:  widget.white ? Colors.white : const Color(0xFF0F382C), width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, size: 18),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TextBlock extends StatefulWidget {
  const TextBlock({
    super.key,
    required this.text,
    this.width,
    this.height,
    this.color,
    this.alignment = Alignment.center,
  }) : assert(
         width != null || height != null,
         'A TextBlock must have either a width or a height.',
       );

  final String text;
  final double? width;
  final double? height;
  final Color? color;
  final Alignment alignment;

  @override
  State<TextBlock> createState() => _TextBlockState();
}

class _TextBlockState extends State<TextBlock> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.width ?? widget.height,
          height: widget.height ?? widget.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _hovering
                ? Color.lerp(widget.color, Colors.black, 0.2)
                : widget.color,
          ),
          child: Align(
            alignment: widget.alignment,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SizedBox(
                width: screenSize.width * 0.07,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    widget.text,
                    style: const TextStyle(color: Colors.white, fontSize: 900),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

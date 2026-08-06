import 'package:flutter/material.dart';

import 'block_container.dart';

class DemoCtaBanner extends StatelessWidget {
  final String heading;
  final String description;
  final VoidCallback? onDemoPressed;
  final Widget? secondaryAction;

  const DemoCtaBanner({
    super.key,
    required this.heading,
    required this.description,
    this.onDemoPressed,
    this.secondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return BlockContainer(
      padding: const EdgeInsets.only(top: 0, bottom: 0),
      hasHorizontalPadding: false,
      screenWidthFactor: 1,
      child: Stack(
        children: [
          Image.asset("lib/assets/frame.png"),
          Padding(
            padding: const EdgeInsets.only(top: 64.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    heading,
                    style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 750),
                    child: Text(
                      description,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w100),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 16,
                    children: [
                      ElevatedButton(
                        onPressed: onDemoPressed ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color.fromRGBO(37, 106, 130, 1),
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          elevation: 0,
                        ),
                        child: const Text('Plan een Demo', style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      ?secondaryAction,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

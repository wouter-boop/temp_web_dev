import 'package:flutter/material.dart';
import 'arrow_button.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.imagePath,
    required this.link,
    required this.uitspraak,
    required this.gezegd_door,
    required this.job,
  });

  final String imagePath;
  final String link;
  final String uitspraak;
  final String gezegd_door;
  final String job;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 700;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
        );
      },
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Text section
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quote area
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "“",
                        style: TextStyle(
                          fontSize: 60,
                          height: 0.7,
                          fontWeight: FontWeight.bold,
                          color: Colors.black26,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Expanded(
                        child: Text(
                          uitspraak,
                          style: const TextStyle(
                            fontSize: 25,
                            height: 1.35,
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Divider
                Container(
                  height: 3,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  "- $gezegd_door",
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  job,
                  style: const TextStyle(fontSize: 17, color: Colors.black54),
                ),

                const SizedBox(height: 18),

                ArrowButton(text: "Lees meer", function: () {}),
              ],
            ),
          ),
        ),

        // Image section
        Expanded(
          flex: 4,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: double.infinity,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Image
        SizedBox(
          height: 180,
          width: double.infinity,
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),

        // Text
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Quote
                Expanded(
                  flex: 12,
                  child: Text(
                    '"$uitspraak"',
                    style: const TextStyle(
                      fontSize: 25,
                      height: 1.35,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const SizedBox(height: 12),

                Container(
                  height: 3,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

                const SizedBox(height: 14),

                Text(
                  "- $gezegd_door",
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  job,
                  style: const TextStyle(fontSize: 17, color: Colors.black54),
                ),

                const SizedBox(height: 14),

                ArrowButton(text: "Lees meer", function: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

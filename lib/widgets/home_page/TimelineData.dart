import 'package:flutter/material.dart';

class TimelineStepData {
  final String title;
  final String description;

  const TimelineStepData({required this.title, required this.description});
}

class ProcessTimelineSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<TimelineStepData> steps;
  final String? footerText;
  final VoidCallback? onFooterTap;

  // Styling customization options
  final Color primaryColor;
  final Color titleTextColor;
  final Color bodyTextColor;
  final Color stepCircleColor;

  const ProcessTimelineSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.steps,
    this.footerText,
    this.onFooterTap,
    this.primaryColor = const Color(0xFF0D4342), // Dark Teal
    this.titleTextColor = const Color(0xFF000000),
    this.bodyTextColor = const Color(0xFF555555),
    this.stepCircleColor = const Color(0xFFE2E4E1),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 64.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: bodyTextColor,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 60),

              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 700) {
                    return _buildVerticalTimeline();
                  }
                  return _buildHorizontalTimeline();
                },
              ),

              const SizedBox(height: 60),

              if (footerText != null)
                Center(
                  child: InkWell(
                    onTap: onFooterTap,
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            footerText!,
                            style: TextStyle(
                              fontSize: 15,
                              color: bodyTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Icon(
                            Icons.arrow_downward_rounded,
                            size: 24,
                            color: titleTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds desktop/wide horizontal timeline layout
  Widget _buildHorizontalTimeline() {
    return Column(
      children: [
        // Number circles + connecting dashed lines
        Row(
          children: List.generate(steps.length * 2 - 1, (index) {
            if (index.isEven) {
              final stepNum = (index ~/ 2) + 1;
              return _StepCircle(
                number: stepNum,
                backgroundColor: stepCircleColor,
                textColor: titleTextColor,
              );
            } else {
              return Expanded(
                child: DashedLineConnector(
                  color: bodyTextColor.withValues(alpha: 0.5),
                ),
              );
            }
          }),
        ),
        const SizedBox(height: 24),

        // Text Content under the numbers
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(steps.length * 2 - 1, (index) {
              if (index.isEven) {
                final stepIndex = index ~/ 2;
                final step = steps[stepIndex];
                return SizedBox(
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        step.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: titleTextColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        step.description,
                        style: TextStyle(
                          fontSize: 13,
                          color: bodyTextColor,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Spacer();
              }
            }),
          ),
        ),
      ],
    );
  }

  /// Responsive vertical layout for mobile devices
  Widget _buildVerticalTimeline() {
    return Column(
      children: List.generate(steps.length, (index) {
        final step = steps[index];
        final isLast = index == steps.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                _StepCircle(
                  number: index + 1,
                  backgroundColor: stepCircleColor,
                  textColor: titleTextColor,
                ),
                if (!isLast)
                  Container(
                    width: 2,
                    height: 60,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: bodyTextColor.withValues(alpha: 0.3),
                  ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: titleTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      step.description,
                      style: TextStyle(
                        fontSize: 13,
                        color: bodyTextColor,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

/// Number circle widget
class _StepCircle extends StatelessWidget {
  final int number;
  final Color backgroundColor;
  final Color textColor;

  const _StepCircle({
    required this.number,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        '$number',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}

/// Custom painter for the horizontal dashed line connector
class DashedLineConnector extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DashedLineConnector({
    super.key,
    required this.color,
    this.dashWidth = 5.0,
    this.dashSpace = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final boxWidth = constraints.maxWidth;
          final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: 1.5,
                child: DecoratedBox(decoration: BoxDecoration(color: color)),
              );
            }),
          );
        },
      ),
    );
  }
}

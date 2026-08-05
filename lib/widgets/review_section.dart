import 'package:flutter/material.dart';

/// Content for a single [TestimonialSection].
class TestimonialData {
  final String photoAsset;
  final List<InlineSpan> quote;
  final String authorName;
  final String authorRole;

  const TestimonialData({
    required this.photoAsset,
    required this.quote,
    required this.authorName,
    required this.authorRole,
  });
}

/// Customer-quote block: photo, quoted testimonial with bold highlights,
/// author byline, a CTA button and a small "trusted by" caption. Scales
/// mildly with viewport width and stays centered instead of pinned left.
class TestimonialSection extends StatelessWidget {
  final TestimonialData data;
  final String ctaLabel;
  final VoidCallback? onCtaPressed;
  final String trustText;

  const TestimonialSection({
    super.key,
    required this.data,
    this.ctaLabel = 'Lees meer klant verhalen',
    this.onCtaPressed,
    this.trustText = 'Vertrouwd door meer dan 500 praktijken',
  });

  static const _referenceWidth = 1920.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final scale = (constraints.maxWidth / _referenceWidth).clamp(0.85, 1.4);
        return Center(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(top: 0, left: 0, child: _CornerAccent(scale: scale)),
              Padding(
                padding: EdgeInsets.only(top: 28 * scale, left: 12 * scale),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20 * scale),
                      child: Image.asset(
                        data.photoAsset,
                        width: 160 * scale,
                        height: 160 * scale,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 160 * scale,
                          height: 160 * scale,
                          color: Colors.black12,
                          alignment: Alignment.center,
                          child: Icon(Icons.person_outline, size: 40 * scale, color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(width: 32 * scale),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 560 * scale),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _QuoteMark(scale: scale),
                            SizedBox(height: 4 * scale),
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(fontSize: 18 * scale, height: 1.55, color: Colors.blueGrey.shade900),
                                    children: data.quote,
                                  ),
                                ),
                                Positioned(
                                  bottom: -18 * scale,
                                  right: -8 * scale,
                                  child: _QuoteMark(closing: true, scale: scale),
                                ),
                              ],
                            ),
                            SizedBox(height: 22 * scale),
                            Text(
                              data.authorName,
                              style: TextStyle(fontSize: 15 * scale, fontWeight: FontWeight.bold, color: Colors.teal.shade600),
                            ),
                            SizedBox(height: 2 * scale),
                            Text(data.authorRole, style: TextStyle(fontSize: 13 * scale, color: Colors.grey.shade600)),
                            SizedBox(height: 24 * scale),
                            OutlinedButton(
                              onPressed: onCtaPressed,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.blueGrey.shade900,
                                side: BorderSide(color: Colors.blueGrey.shade900),
                                padding: EdgeInsets.symmetric(horizontal: 20 * scale, vertical: 12 * scale),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24 * scale)),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(ctaLabel, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14 * scale)),
                                  SizedBox(width: 8 * scale),
                                  Icon(Icons.arrow_forward, size: 16 * scale),
                                ],
                              ),
                            ),
                            SizedBox(height: 48 * scale),
                            Container(width: 40 * scale, height: 1, color: Colors.grey.shade300),
                            SizedBox(height: 14 * scale),
                            Text(trustText, style: TextStyle(fontSize: 12 * scale, color: Colors.grey.shade600)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _QuoteMark extends StatelessWidget {
  final bool closing;
  final double scale;

  const _QuoteMark({super.key, this.closing = false, this.scale = 1.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      closing ? '\u201D' : '\u201C',
      style: TextStyle(fontSize: 64 * scale, fontWeight: FontWeight.w900, color: Colors.teal.shade600, height: 0.5),
    );
  }
}

class _CornerAccent extends StatelessWidget {
  final double scale;

  const _CornerAccent({this.scale = 1.0});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: Size(24 * scale, 24 * scale), painter: _CornerAccentPainter());
  }
}

class _CornerAccentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.teal.shade600;
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
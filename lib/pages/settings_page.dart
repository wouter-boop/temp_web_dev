import 'package:flutter/material.dart';

// Helper model to represent appointment blocks
class Appointment {
  final double start;
  final double end;
  final String title;

  Appointment({required this.start, required this.end, required this.title});

  bool contains(double point) => point >= start && point <= end;
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Timeline runs from 0 to 12
  final double _minTime = 0.0;
  final double _maxTime = 12.0;

  // Indicator position (starts at hour 1)
  double _currentTime = 1.0;

  // Appointment time blocks
  final List<Appointment> _appointments = [
    Appointment(start: 2.0, end: 4.0, title: 'Morning Meeting'),
    Appointment(start: 7.0, end: 10.0, title: 'Deep Work Session'),
  ];

  // Helper to check if current indicator position falls within any appointment
  Appointment? get _activeAppointment {
    for (final appt in _appointments) {
      if (appt.contains(_currentTime)) return appt;
    }
    return null;
  }

  void _updatePositionFromTap(double dx, double maxLayoutWidth) {
    setState(() {
      // Convert physical pixel drag location to time value (0 to 12)
      final double fraction = (dx / maxLayoutWidth).clamp(0.0, 1.0);
      _currentTime = _minTime + (fraction * (_maxTime - _minTime));
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeAppt = _activeAppointment;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Box-style timeline track
          LayoutBuilder(
            builder: (context, constraints) {
              final trackWidth = constraints.maxWidth;
              final double hourWidth = trackWidth / (_maxTime - _minTime);

              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onPanUpdate: (details) => _updatePositionFromTap(
                  details.localPosition.dx,
                  trackWidth,
                ),
                onTapDown: (details) => _updatePositionFromTap(
                  details.localPosition.dx,
                  trackWidth,
                ),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Render appointment boxes inside the timeline
                      ..._appointments.map((appt) {
                        final leftPadding = (appt.start - _minTime) * hourWidth;
                        final blockWidth = (appt.end - appt.start) * hourWidth;

                        return Positioned(
                          left: leftPadding,
                          width: blockWidth,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.indigo.withValues(alpha: 0.35),
                              border: Border.symmetric(
                                vertical: BorderSide(
                                  color: Colors.indigo,
                                  width: 2,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${appt.start.toInt()}-${appt.end.toInt()}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo.shade900,
                              ),
                            ),
                          ),
                        );
                      }),

                      // Draggable indicator bar
                      Positioned(
                        left: ((_currentTime - _minTime) * hourWidth) - 2,
                        top: -6,
                        bottom: -6,
                        child: Container(
                          width: 4,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(2),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),

          // Dynamic status text under the timeline
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: activeAppt != null
                  ? Colors.amber.shade100
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              activeAppt != null
                  ? 'In appointment (${activeAppt.title})'
                  : 'Time: ${_currentTime.toStringAsFixed(1)} h',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: activeAppt != null
                    ? Colors.amber.shade900
                    : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

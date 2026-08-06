import 'package:flutter/material.dart';

class RoleCardData {
  final IconData icon;
  final String title;
  final String description;

  const RoleCardData({required this.icon, required this.title, required this.description});
}

class RoleCard extends StatelessWidget {
  final RoleCardData data;

  const RoleCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 540,
      height: 200,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 12, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(data.icon, size: 28, color: const Color(0xFF17A8A6)),
          const SizedBox(height: 18),
          Text(
            data.title,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Color(0xFF16324A)),
          ),
          const SizedBox(height: 8),
          Text(
            data.description,
            style: const TextStyle(fontSize: 14, color: Color(0xFF6B6B6B), height: 1.5),
          ),
        ],
      ),
    );
  }
}

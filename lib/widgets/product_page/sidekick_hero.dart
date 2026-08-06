import 'dart:ui';

import 'package:flutter/material.dart';

class SidekickHero extends StatelessWidget {
  const SidekickHero({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 72, vertical: 56),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("lib/assets/Odontium.png", width: 72),
            Text(
              "Odontium",
              textAlign: TextAlign.center,
              style: theme.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF083844),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Odontium is de complete praktijksoftware voor de moderne mondzorg.",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xFF083844),
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              "Met één gebruiksvriendelijk platform beheert u afspraken, patiëntendossiers, behandelingen, declaraties en communicatie. Dankzij verschillende werkomgevingen sluit Odontium naadloos aan op de dagelijkse processen van iedere discipline.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.black87,
                height: 1.65,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF11B8BE),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 18,
                    ),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: const Text("Plan een Demo"),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF083844),
                    side: const BorderSide(color: Color(0xFF083844)),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 18,
                    ),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: const Text("Bekijk de functionaliteiten"),
                ),
              ],
            ),
            ImageFiltered(
              imageFilter: ImageFilter.dilate(radiusX: 0),
              child: Transform.scale(
                scale: 1,
                child: Opacity(
                  opacity: 1,
                  child: Image.asset(
                    "lib/assets/scherm_odontium.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
// return Padding(
//   padding: const EdgeInsets.symmetric(
//     horizontal: 72,
//     vertical: 56,
//   ),
//   child: Row(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Expanded(
//         flex: 5,
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: 440),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Logo
//               Image.asset(
//                 "lib/assets/Odontium.png",
//                 width: 72,
//               ),
//
//               const SizedBox(height: 24),
//
//               Text(
//                 "Odontium",
//                 style: theme.textTheme.displaySmall?.copyWith(
//                   fontWeight: FontWeight.w800,
//                   color: const Color(0xFF083844),
//                 ),
//               ),
//
//               const SizedBox(height: 8),
//
//               Text(
//                 "Odontium is de complete praktijksoftware\nvoor de moderne mondzorg.",
//                 style: theme.textTheme.titleMedium?.copyWith(
//                   fontWeight: FontWeight.w700,
//                   color: const Color(0xFF083844),
//                   height: 1.4,
//                 ),
//               ),
//
//               const SizedBox(height: 18),
//
//               Text(
//                 "Met één gebruiksvriendelijk platform beheert u afspraken, patiëntendossiers, behandelingen, declaraties en communicatie. Dankzij verschillende werkomgevingen sluit Odontium naadloos aan op de dagelijkse processen van iedere discipline.",
//                 style: theme.textTheme.bodyLarge?.copyWith(
//                   color: Colors.black87,
//                   height: 1.65,
//                 ),
//               ),
//
//               const SizedBox(height: 28),
//
//               Row(
//                 children: [
//                   FilledButton(
//                     style: FilledButton.styleFrom(
//                       backgroundColor: const Color(0xFF11B8BE),
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 28,
//                         vertical: 18,
//                       ),
//                       shape: const StadiumBorder(),
//                     ),
//                     onPressed: () {},
//                     child: const Text("Plan een Demo"),
//                   ),
//                   const SizedBox(width: 16),
//                   OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: const Color(0xFF083844),
//                       side: const BorderSide(
//                         color: Color(0xFF083844),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 28,
//                         vertical: 18,
//                       ),
//                       shape: const StadiumBorder(),
//                     ),
//                     onPressed: () {},
//                     child: const Text("Bekijk de functionaliteiten"),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//
//       const Spacer(),
//       Expanded(
//         flex: 6,
//         child: Center(
//           child: Stack(
//             alignment: Alignment.center,
//             children: [
//               Transform.translate(
//                 offset: const Offset(4, 14),
//                 child: ImageFiltered(
//                   imageFilter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
//                   child: Transform.scale(
//                     scale: 0.92,
//                     child: Opacity(
//                       opacity: 1,
//                       child: Image.asset(
//                         "lib/assets/scherm_odontium.png",
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               // 2. The Original Main Image
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(18),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(18),
//                   child: Image.asset(
//                     "lib/assets/scherm_odontium.png",
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// );

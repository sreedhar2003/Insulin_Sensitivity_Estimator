import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:insulin_sensitivity_estimator/helpers/appcolors.dart';

class InsulinBar extends StatefulWidget {
  final double insulinValue; // HOMA-IR score

  const InsulinBar({super.key, required this.insulinValue});

  @override
  State<InsulinBar> createState() => _InsulinBarState();
}

class _InsulinBarState extends State<InsulinBar> {
  /// Map HOMA-IR value to indicator position (0.0 → 1.0 across the bar)
  double mapScoreToPosition(double value) {
    if (value <= 2.0) {
      // 0 → 0.0 , 2.0 → 0.40
      return (value / 2.0) * 0.40;
    } else if (value <= 2.9) {
      // 2.0 → 0.40 , 2.9 → 0.58
      return 0.40 + ((value - 2.0) / 0.9) * (0.58 - 0.40);
    } else if (value <= 5.0) {
      // 2.9 → 0.58 , 5.0 → 1.0
      return 0.58 + ((value - 2.9) / 2.1) * (1.0 - 0.58);
    } else {
      // Anything above 5 clamps to end
      return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double indicatorPosition = mapScoreToPosition(widget.insulinValue);

    print(
        'HOMA-IR Score: ${widget.insulinValue}, Indicator Position: $indicatorPosition');

    return Column(
      children: [
        // The indicator bar
        LayoutBuilder(
          builder: (context, constraints) {
            final double barWidth = constraints.maxWidth;

            return Stack(
              children: [
                // The gradient bar
                Container(
                  height: 12,
                  width: barWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF4CAF50), // Green (optimal)
                        Color(0xFF4CAF50),
                        Color(0xFFFF9800), // Orange
                        Color(0xFFFF9800),
                        Color(0xFFF44336), // Red
                      ],
                      stops: [0.0, 0.2, 0.4, 0.58, 1.0],
                    ),
                  ),
                ),

                // Divider lines
                // Positioned(
                //   left: barWidth * 0.40, // At score 2.0
                //   child: Container(
                //     width: 1,
                //     height: 12,
                //     color: Colors.white.withOpacity(0.7),
                //   ),
                // ),
                // Positioned(
                //   left: barWidth * 0.58, // At score 2.9
                //   child: Container(
                //     width: 1,
                //     height: 12,
                //     color: Colors.white.withOpacity(0.7),
                //   ),
                // ),

                // The animated indicator
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  left: max(
                    0,
                    min(barWidth - 12, (barWidth - 12) * indicatorPosition),
                  ),
                  top: -10,
                  child: Column(
                    children: [
                      Container(
                        width: 2,
                        height: 6,
                        color: Colors.black87,
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black87,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),

        const SizedBox(height: 8),
        // Range labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Optimal',
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '(<1.0)',
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Normal',
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '(1.0-1.9)',
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Early Resistance',
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '(2.0-2.9)',
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Significant',
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '(≥3.0)',
                  style: GoogleFonts.roboto(
                    color: AppColors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

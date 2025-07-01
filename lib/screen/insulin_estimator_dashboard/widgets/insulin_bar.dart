import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insulin_sensitivity_estimator/helpers/appcolors.dart';
import 'package:insulin_sensitivity_estimator/helpers/size_extension.dart';
import 'package:insulin_sensitivity_estimator/helpers/sizedbox.dart';

class InsulinBar extends StatelessWidget {
  final double insulinValue;

  const InsulinBar({super.key, required this.insulinValue});

  @override
  Widget build(BuildContext context) {
    const double minValue = 70;
    const double maxValue = 180;

    double normalized =
        ((insulinValue - minValue) / (maxValue - minValue)).clamp(0.0, 1.0);
    double barWidth = MediaQuery.of(context).size.width - 40;

    List<Color> gradientColors;
    List<double> stops;

    if (insulinValue <= 99) {
      gradientColors = [AppColors.green, AppColors.green];
      stops = [0.0, 1.0];
    } else if (insulinValue <= 125) {
      gradientColors = [AppColors.green, AppColors.yellow];
      stops = [0.0, 1.0];
    } else {
      gradientColors = [AppColors.green, AppColors.yellow, AppColors.red];
      stops = [0.0, 0.6, 1.0];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              width: barWidth,
              height: 16,
              decoration: BoxDecoration(
                color: AppColors.percentagebg,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              width: barWidth * normalized,
              height: 16,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  stops: stops,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.6 * normalized,
              child: Container(
                width: 1,
                height: 20,
                color: AppColors.black,
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.8 * normalized,
              child: Container(
                width: 1,
                height: 20,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        sizedBoxWithHeight(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Sensitive (<1.0)",
                style: GoogleFonts.roboto(
                  color: AppColors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Normal (1.0-1.9)",
                style: GoogleFonts.roboto(
                  color: AppColors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Early Resistance (2.0-2.9)",
                style: GoogleFonts.roboto(
                  color: AppColors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Expanded(
              child: Text(
                "Resistant (≥3.0)",
                style: GoogleFonts.roboto(
                  color: AppColors.grey,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

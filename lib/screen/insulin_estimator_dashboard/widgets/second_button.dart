import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insulin_sensitivity_estimator/helpers/appcolors.dart';
import 'package:insulin_sensitivity_estimator/helpers/size_extension.dart';

class SecondButton extends StatelessWidget {
  final String subject;
  final GestureTapCallback ontap;
  const SecondButton({super.key, required this.subject, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(82),
          border: Border.all(color: AppColors.grey),
        ),
        child: Center(
          child: Text(
            subject,
            style: GoogleFonts.roboto(
              color: AppColors.grey,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

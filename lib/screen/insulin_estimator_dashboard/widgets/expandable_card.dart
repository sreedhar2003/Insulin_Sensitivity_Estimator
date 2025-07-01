import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insulin_sensitivity_estimator/helpers/appcolors.dart';
import 'package:insulin_sensitivity_estimator/helpers/screen_config.dart';
import 'package:insulin_sensitivity_estimator/helpers/size_extension.dart';
import 'package:insulin_sensitivity_estimator/helpers/sizedbox.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/controller/insulin_estimator_controller.dart';
import 'package:provider/provider.dart';

class ExpandableCard extends StatefulWidget {
  final String heading;
  final String description;
  const ExpandableCard(
      {super.key, required this.heading, required this.description});

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InsulinEstimatorController>();
    ScreenUtil.getInstance().init(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          provider.isExpanded = !provider.isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.heading,
                  style: GoogleFonts.roboto(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Icon(
                  provider.isExpanded
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color:
                      provider.isExpanded ? AppColors.black : AppColors.black,
                ),
              ],
            ),
            if (provider.isExpanded) ...[
              sizedBoxWithHeight(5),
              const Divider(color: AppColors.green),
              sizedBoxWithHeight(5),
              Text(
                widget.description,
                maxLines: 7,
                style: GoogleFonts.roboto(
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

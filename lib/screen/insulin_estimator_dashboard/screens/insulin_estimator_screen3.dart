import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insulin_sensitivity_estimator/helpers/appcolors.dart';
import 'package:insulin_sensitivity_estimator/helpers/screen_config.dart';
import 'package:insulin_sensitivity_estimator/helpers/size_extension.dart';
import 'package:insulin_sensitivity_estimator/helpers/sizedbox.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/controller/insulin_estimator_controller.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/screens/insulin_estimator_screen2.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/widgets/buttons.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/widgets/expandable_card.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/widgets/insulin_bar.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/widgets/second_button.dart';
import 'package:provider/provider.dart';

class InsulinEstimatorScreen3 extends StatefulWidget {
  final double GlucoseValue;
  final double InsulinValue;
  const InsulinEstimatorScreen3(
      {super.key, required this.GlucoseValue, required this.InsulinValue});

  @override
  State<InsulinEstimatorScreen3> createState() =>
      _InsulinEstimatorScreen3State();
}

class _InsulinEstimatorScreen3State extends State<InsulinEstimatorScreen3> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<InsulinEstimatorController>();
    ScreenUtil.getInstance().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: AppColors.black,
            ),
          ),
          title: Center(
            child: Text(
              "Insulin Sensitivity Estimator",
              style: GoogleFonts.roboto(
                color: AppColors.black,
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Center(
                      child: Text(
                        "Insulin Sensitivity Estimator",
                        style: GoogleFonts.roboto(
                          color: AppColors.titlecolor,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  sizedBoxWithHeight(40),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.containercolor,
                      border: Border.all(
                        color: AppColors.titlecolor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Your Insulin Resistance Estimate (HOMA-IR)",
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            color: AppColors.headingcolor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Text(
                          "1.0",
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            color: AppColors.headingcolor,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        //  utilize the percentage bar
                        const InsulinBar(insulinValue: 200), //change as backend
                        sizedBoxWithHeight(20),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.containercolor,
                            border: Border.all(
                              color: AppColors.titlecolor,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "✅ Yours HOMA-IR score suggests ",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "very good insulin sensitivity. ",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.green,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "Keep up your healthy habits!",
                                  style: GoogleFonts.roboto(
                                    color: AppColors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        sizedBoxWithHeight(20),
                        Buttons(
                            subject: "See Lifestyle Plan to Improve",
                            ontap: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //     ));
                            }),
                        sizedBoxWithHeight(20),
                        SecondButton(subject: "Talk to A Doctor", ontap: () {}),
                        sizedBoxWithHeight(20),
                        SecondButton(
                            subject: "Track My Insulin Trends", ontap: () {}),
                        sizedBoxWithHeight(20),
                        SecondButton(
                            subject: "Recheck After 3 Months", ontap: () {}),
                        sizedBoxWithHeight(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              value: provider.isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  provider.isChecked = value!;
                                });
                              },
                            ),
                            sizedBoxWithWidth(5),
                            Image.asset(
                              "assets/images/stars_symbol.png",
                              height: 14,
                              width: 14,
                              fit: BoxFit.cover,
                            ),
                            sizedBoxWithWidth(5),
                            Text(
                              "Save to Profile",
                              style: GoogleFonts.roboto(
                                color: AppColors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        sizedBoxWithHeight(10),
                        SecondButton(
                            subject: "Recalculate",
                            ontap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const InsulinEstimatorScreen2()));
                            }),
                        sizedBoxWithHeight(10),
                        Column(
                            children: List.generate(
                                provider.informations.length,
                                (index) => ExpandableCard(
                                    heading: provider.informations[index]
                                        ["heading"],
                                    description: provider.informations[index]
                                        ["description"])))
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }
}

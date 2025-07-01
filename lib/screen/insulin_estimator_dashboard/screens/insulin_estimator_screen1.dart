import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insulin_sensitivity_estimator/helpers/appcolors.dart';
import 'package:insulin_sensitivity_estimator/helpers/screen_config.dart';
import 'package:insulin_sensitivity_estimator/helpers/size_extension.dart';
import 'package:insulin_sensitivity_estimator/helpers/sizedbox.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/screens/insulin_estimator_screen2.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/widgets/buttons.dart';

class InsulinEstimatorScreen1 extends StatefulWidget {
  const InsulinEstimatorScreen1({super.key});

  @override
  State<InsulinEstimatorScreen1> createState() =>
      _InsulinEstimatorScreen1State();
}

class _InsulinEstimatorScreen1State extends State<InsulinEstimatorScreen1> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.getInstance().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        leading: IconButton(
          onPressed: () {},
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
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Insulin Sensitivity Estimator",
                    maxLines: 2,
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
                      "Check Your Insulin Sensitivity",
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.headingcolor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Text(
                      "Understand how your body responds to insulin — a key marker in weight gain, PCOS, prediabetes, and more.",
                      maxLines: 2,
                      style: GoogleFonts.roboto(
                        color: AppColors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    sizedBoxWithHeight(10),
                    Image.asset(
                      height: 60,
                      width: 60,
                      "assets/images/insulin_logo.png",
                      fit: BoxFit.cover,
                    ),
                    sizedBoxWithHeight(10),
                    Buttons(
                        subject: "Start Estimation",
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const InsulinEstimatorScreen2(),
                              ));
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

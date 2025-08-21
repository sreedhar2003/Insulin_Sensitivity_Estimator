import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insulin_sensitivity_estimator/helpers/appcolors.dart';
import 'package:insulin_sensitivity_estimator/helpers/screen_config.dart';
import 'package:insulin_sensitivity_estimator/helpers/size_extension.dart';
import 'package:insulin_sensitivity_estimator/helpers/sizedbox.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/controller/insulin_estimator_controller.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/screens/insulin_estimator_resultscreen.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/widgets/buttons.dart';
import 'package:provider/provider.dart';

class InsulinEstimatorScreen2 extends StatefulWidget {
  const InsulinEstimatorScreen2({super.key});

  @override
  State<InsulinEstimatorScreen2> createState() =>
      _InsulinEstimatorScreen2State();
}

class _InsulinEstimatorScreen2State extends State<InsulinEstimatorScreen2> {
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
                    child: Form(
                      key: provider.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Enter Your Lab Results",
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                              color: AppColors.headingcolor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          sizedBoxWithHeight(10),
                          Text(
                            "Fasting Glucose (mg/dL)",
                            style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxWithHeight(20),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              controller: provider.Glucosecontroller,
                              decoration: InputDecoration(
                                hintText: "Enter Glucose value",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: AppColors.titlecolor, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: AppColors.titlecolor, width: 1)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: AppColors.red, width: 1)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: AppColors.red, width: 1)),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter a glucose value';
                                }
                                final parsed = double.tryParse(value.trim());
                                if (parsed == null) {
                                  return 'Enter a valid number';
                                }
                                if (parsed < 60 || parsed > 300) {
                                  return 'Enter a realistic glucose value (60-300 mg/dL)';
                                }
                                return null;
                              },
                            ),
                          ),
                          sizedBoxWithHeight(20),
                          Text(
                            "Taken after 8-12 hours of fasting",
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                              color: AppColors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxWithHeight(10),
                          Text(
                            "Fasting Insulin (µU/mL)",
                            style: GoogleFonts.roboto(
                              color: AppColors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxWithHeight(20),
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              controller: provider.Insulincontroller,
                              decoration: InputDecoration(
                                hintText: "Enter Insulin value",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: AppColors.titlecolor, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: AppColors.titlecolor, width: 1)),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: AppColors.red, width: 1)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: const BorderSide(
                                        color: AppColors.red, width: 1)),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter an insulin value';
                                }
                                final parsed = double.tryParse(value.trim());
                                if (parsed == null) {
                                  return 'Enter a valid number';
                                }
                                if (parsed < 1 || parsed > 100) {
                                  return 'Enter a realistic insulin value (1-100 µU/mL)';
                                }
                                return null;
                              },
                            ),
                          ),
                          sizedBoxWithHeight(20),
                          Text(
                            "Measured in morning after fasting",
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                              color: AppColors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          sizedBoxWithHeight(20),
                          Buttons(
                              subject: "Calculate HOMA-IR",
                              ontap: () {
                                if (provider.formKey.currentState!.validate()) {
                                  final glucose = double.parse(
                                      provider.Glucosecontroller.text.trim());
                                  final insulin = double.parse(
                                      provider.Insulincontroller.text.trim());

                                  // Calculate HOMA-IR in the controller
                                  provider.calculateHomaIr(glucose, insulin);

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const InsulinEstimatorResultScreen(),
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}

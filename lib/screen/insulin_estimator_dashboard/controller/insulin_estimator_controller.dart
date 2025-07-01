import 'package:flutter/material.dart';

class InsulinEstimatorController with ChangeNotifier {
  TextEditingController Glucosecontroller = TextEditingController();
  TextEditingController Insulincontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isExpanded = false;

  List<Map<String, dynamic>> informations = [
    {
      "heading": "What is Insulin Resistance?",
      "description":
          "Insulin resistance occurs when cells in your muscles, fat, and liver don't respond well to insulin and can't easily take up glucose from your blood. As a result, your pancreas makes more insulin to help glucose enter your cells."
    },
    {
      "heading": "Why does this matter?",
      "description": """Insulin resistance is a major risk factor for:
     • Type 2 Diabetes
     • Weight gain and difficulty losing weight
     • Polycystic Ovary Syndrome (PCOS)
     • Heart disease and stroke"""
    },
    {
      "heading": "What can I do to improve it?",
      "description":
          """Lifestyle changes can significantly improve insulin sensitivity:
     • Regular physical activity (e.g., 30 mins/day)
     • Balanced diet rich in whole foods, fiber, and lean protein
     • Weight management
     • Adequate sleep
     • Stress reduction"""
    },
  ];
}

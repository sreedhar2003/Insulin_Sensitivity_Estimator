import 'package:flutter/material.dart';

enum HomaIrStatus {
  optimal,
  earlyResistance,
  significantResistance,
  none,
}

class InsulinEstimatorController with ChangeNotifier {
  TextEditingController Glucosecontroller = TextEditingController();
  TextEditingController Insulincontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  bool isExpanded = false;

  // HOMA-IR calculation properties
  double? _homaIrScore;
  HomaIrStatus _status = HomaIrStatus.none;

  // Getters
  double? get homaIrScore => _homaIrScore;
  HomaIrStatus get status => _status;

  // Calculate HOMA-IR score
  void calculateHomaIr(double glucose, double insulin) {
    if (glucose > 0 && insulin > 0) {
      final score = (glucose * insulin) / 405;
      _homaIrScore = score;

      if (score < 2.0) {
        _status = HomaIrStatus.optimal;
      } else if (score < 2.9) {
        _status = HomaIrStatus.earlyResistance;
      } else {
        _status = HomaIrStatus.significantResistance;
      }
    } else {
      _homaIrScore = null;
      _status = HomaIrStatus.none;
    }
    notifyListeners();
  }

  // Get status properties for UI display
  Map<String, dynamic> getStatusProperties() {
    switch (_status) {
      case HomaIrStatus.optimal:
        return {
          'text': 'Very Good Insulin Sensitivity',
          'color': Colors.green,
          'message':
              '✅ Your HOMA-IR score suggests very good insulin sensitivity. Keep up your healthy habits!',
          'emoji': '✅'
        };
      case HomaIrStatus.earlyResistance:
        return {
          'text': 'Early Insulin Resistance',
          'color': Colors.orange,
          'message':
              '⚠️ Your HOMA-IR score suggests early insulin resistance. Consider lifestyle modifications.',
          'emoji': '⚠️'
        };
      case HomaIrStatus.significantResistance:
        return {
          'text': 'Significant Insulin Resistance',
          'color': Colors.red,
          'message':
              '🚨 Your HOMA-IR score suggests significant insulin resistance. Please consult with a healthcare provider.',
          'emoji': '🚨'
        };
      default:
        return {
          'text': 'Enter Your Values',
          'color': Colors.grey,
          'message': 'Please enter your lab values to calculate HOMA-IR.',
          'emoji': ''
        };
    }
  }

  // Reset values
  void reset() {
    Glucosecontroller.clear();
    Insulincontroller.clear();
    _homaIrScore = null;
    _status = HomaIrStatus.none;
    isChecked = false;
    notifyListeners();
  }

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
    {
      "heading": "Understanding HOMA-IR Ranges",
      "description": """HOMA-IR Score Interpretation:
• Below 2.0: Optimal insulin sensitivity
• 2.0 - 2.9: Early insulin resistance
• Above 2.9: Significant insulin resistance

The formula used: HOMA-IR = (Glucose × Insulin) ÷ 405"""
    },
  ];
}

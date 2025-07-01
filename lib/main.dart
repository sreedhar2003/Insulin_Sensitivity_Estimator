import 'package:flutter/material.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/controller/insulin_estimator_controller.dart';
import 'package:insulin_sensitivity_estimator/screen/insulin_estimator_dashboard/screens/insulin_estimator_screen1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => InsulinEstimatorController(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: InsulinEstimatorScreen1());
  }
}

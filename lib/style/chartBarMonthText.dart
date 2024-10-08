import 'package:flutter/material.dart';
import 'package:responsive_bank_dashboard/style/bar_chart_textstyle.dart';
import 'package:responsive_bank_dashboard/style/colors.dart';

import '../config/responsive.dart';

class BarChartText extends StatelessWidget {
  final String month;
  const BarChartText({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Text(
        month,
        style: TextStyle(
      fontSize: Responsive.isDesktop(context) ? 14.0: 10.0,
      color: AppColors.secondary,
      fontFamily: 'Poppins',
    ),
      ),
    );
  }
}

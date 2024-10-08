import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_bank_dashboard/config/size_config.dart';
import 'package:responsive_bank_dashboard/style/colors.dart';
import '../config/responsive.dart';
import '../style/chartBarMonthText.dart';

class BarChartComponent extends StatelessWidget {
  const BarChartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.isDesktop(context) ? 350 : 200, // Set desired height
      width: Responsive.isDesktop(context)
          ? double.infinity
          : SizeConfig.screenWidth, // Set width to match parent
      child: BarChart(
        BarChartData(
          borderData: FlBorderData(
            show: true,
            border: const Border(
              top: BorderSide(
                width: 1.0,
                color: Color.fromARGB(255, 192, 192, 192),
              ),
            ),
          ),
          alignment: BarChartAlignment.spaceBetween,
          gridData: const FlGridData(
            drawHorizontalLine: true,
            horizontalInterval: 25,
          ),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Disable top labels
            ),
            // rightTitles: const AxisTitles(
            //   sideTitles: SideTitles(showTitles: true), // Disable top labels
            // ),
            show: true,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const BarChartText(month: "0");
                    case 30:
                      return const BarChartText(month: "30k");
                    case 60:
                      return const BarChartText(month: "60k");
                    case 90:
                      return const BarChartText(month: "90k");
                    default:
                      return Container();
                  }
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const BarChartText(month: "JAN");
                    case 1:
                      return const BarChartText(month: "FEB");
                    case 2:
                      return const BarChartText(month: "MAR");
                    case 3:
                      return const BarChartText(month: "APR");
                    case 4:
                      return const BarChartText(month: "MAY");
                    case 5:
                      return const BarChartText(month: "JUN");
                    case 6:
                      return const BarChartText(month: "JUL");
                    case 7:
                      return const BarChartText(month: "AUG");
                    case 8:
                      return const BarChartText(month: "SEP");
                    case 9:
                      return const BarChartText(month: "OCT");
                    case 10:
                      return const BarChartText(month: "NOV");
                    case 11:
                      return const BarChartText(month: "DEC");
                    default:
                      return Container();
                  }
                },
              ),
            ),
          ),
          barGroups: _buildBarGroups(context),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipPadding: const EdgeInsets.all(8),
              tooltipRoundedRadius: 10, // Add rounded corners

              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                List<String> labels = [
                  'Feeding',
                  'Expenses',
                  'Maintenance',
                  'Other Expenses',
                  'Miscellaneous',
                  'Bills',
                  'Rent',
                  'Fuel',
                  'Insurance',
                  'Groceries',
                  'Savings',
                  'Leisure'
                ];
                return BarTooltipItem(
                  labels[group.x], // Display the corresponding word
                  const TextStyle(color: Colors.white),
                );
              },
            ),
          ),
        ),
        swapAnimationDuration: const Duration(milliseconds: 150),
        swapAnimationCurve: Curves.linear,
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(BuildContext context) {
    final List<double> yValues = [
      10,
      50,
      30,
      80,
      70,
      20,
      90,
      60,
      90,
      10,
      40,
      80
    ];

    return List.generate(yValues.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: yValues[index],
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(0),
            width: !Responsive.isDesktop(context)
                ? 12
                : 40, // Adjust width if necessary
            backDrawRodData: BackgroundBarChartRodData(
              toY: 40,
              show: true,
              color: AppColors.barBg,
            ),
          ),
        ],
      );
    });
  }
}

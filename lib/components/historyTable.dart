import 'package:flutter/material.dart';
import 'package:responsive_bank_dashboard/config/size_config.dart';
import 'package:responsive_bank_dashboard/data.dart';
import 'package:responsive_bank_dashboard/style/colors.dart';
import 'package:responsive_bank_dashboard/style/textStyle.dart';

import '../config/responsive.dart';

class Historytable extends StatelessWidget {
  const Historytable({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection:
          Responsive.isDesktop(context) ? Axis.vertical : Axis.horizontal,
      child: SizedBox(
          width: Responsive.isDesktop(context)
              ? double.infinity
              : SizeConfig.screenWidth,
          child: Table(
            // border: TableBorder.all(color: Colors.black),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: List.generate(
              transactionHistory.length,
              (index) => TableRow(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      top: 10.0,
                      bottom: 10.0,
                      left: Responsive.isDesktop(context) ? 20.0 : 0,
                    ),
                    child: CircleAvatar(
                      radius: Responsive.isDesktop(context) ? 17 : 15,
                      backgroundImage: NetworkImage(
                        transactionHistory[index]["avatar"]!,
                      ),
                    ),
                  ),
                  PrimaryText(
                    text: transactionHistory[index]["label"]!,
                    size: Responsive.isDesktop(context) ? 16 : 14,
                    color: AppColors.secondary,
                  ),
                  PrimaryText(
                    text: transactionHistory[index]["amount"]!,
                    size: Responsive.isDesktop(context) ? 16 : 14,
                    color: AppColors.secondary,
                  ),
                  PrimaryText(
                    text: transactionHistory[index]["time"]!,
                    size: Responsive.isDesktop(context) ? 16 : 14,
                    color: AppColors.secondary,
                  ),
                  PrimaryText(
                    text: transactionHistory[index]["status"]!,
                    size: Responsive.isDesktop(context) ? 16 : 14,
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_bank_dashboard/data.dart';
import 'package:responsive_bank_dashboard/style/textStyle.dart';

import '../config/responsive.dart';
import '../config/size_config.dart';
import '../style/colors.dart';
import 'payment_list_tile.dart';

class PaymentCardAndDetails extends StatelessWidget {
  const PaymentCardAndDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 4,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: AppColors.iconGray,
                blurRadius: 20.0,
                offset: Offset(10.0, 20.0),
              )
            ],
          ),
          child: Image.asset("assets/card.png"),
        ),
        SizedBox(
          height: Responsive.isDesktop(context)
              ? SizeConfig.blockSizeVertical! * 3
              : SizeConfig.blockSizeVertical! * 5,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(
              text: "Recent Activities",
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: "02 Mar 2021",
              size: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        // Transfer history
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
            recentActivities.length,
            (index) => PaymentListTile(
              icon: recentActivities[index]["icon"],
              label: recentActivities[index]["label"],
              amount: recentActivities[index]["amount"],
            ),
          ),
        ),

        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),

        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(
              text: "Upcoming Activities",
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: "02 Mar 2021",
              size: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        // Transfer history
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
            upcomingPayments.length,
            (index) => PaymentListTile(
              icon: upcomingPayments[index]["icon"],
              label: upcomingPayments[index]["label"],
              amount: upcomingPayments[index]["amount"],
            ),
          ),
        ),
      ],
    );
  }
}

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:responsive_bank_dashboard/components/historyTable.dart';
import 'package:responsive_bank_dashboard/config/responsive.dart';
import 'package:responsive_bank_dashboard/config/size_config.dart';
import 'package:responsive_bank_dashboard/style/textStyle.dart';
import 'components/app_bar_action_icons.dart';
import 'components/bar_chart_component.dart';
import 'components/dashHeader.dart';
import 'components/paymentInfoCard.dart';
import 'components/payment_card._and_details.dart';
import 'components/sideMenu.dart';
import 'style/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Ensure initialization
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(
        width: 150,
        child: SideMenu(),
      ),
      appBar: !Responsive.isDesktop(
              context) // the exclamation mark there makes it - if not a desktop screen
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState?.openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: AppColors.black,
                ),
              ),
              actions: [
                AppBarActionIcons(),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              // Flex 1. THE LEFT SIDE
              const Expanded(
                flex: 1,
                // The Side Menu
                child: SideMenu(),
              ),

            // Flex 2, THE MIDDLE PART
            Expanded(
              flex: 15,
              child: Container(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                // color: AppColors.secondaryBg,
                padding: EdgeInsets.symmetric(
                  vertical: Responsive.isDesktop(context) ? 30.0 : 15,
                  horizontal: Responsive.isDesktop(context) ? 40.0 : 15,
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      right: Responsive.isDesktop(context) ? 15.0 : 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // The Header
                      const DashHeader(),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 4,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth! * 4,
                        child: const Wrap(
                          runSpacing: 20.0,
                          spacing: 20.0,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            PaymentInfoCard(
                                icon: "assets/credit-card.svg",
                                detail: "Transfer via\nCard Number",
                                amount: "\$1400"),
                            PaymentInfoCard(
                                icon: "assets/transfer.svg",
                                detail: "Transfer via\nOther Banks",
                                amount: "\$800"),
                            PaymentInfoCard(
                                icon: "assets/bank.svg",
                                detail: "Transfer via\nSame Bank",
                                amount: "\$100"),
                            PaymentInfoCard(
                                icon: "assets/invoice.svg",
                                detail: "Transfer via\nOther Bank",
                                amount: "\$1500"),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 4,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryText(
                                text: "Balance",
                                size: Responsive.isDesktop(context) ? 16 : 18,
                                color: AppColors.secondary,
                              ),
                              PrimaryText(
                                text: "\$3000",
                                size: Responsive.isDesktop(context) ? 30 : 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                          PrimaryText(
                            text: "PAST 30 DAYS",
                            size: 14,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                      const BarChartComponent(),

                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 4,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: "History",
                            size: Responsive.isDesktop(context) ? 30 : 26,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w800,
                          ),
                          PrimaryText(
                            text: "Transaction of last 2 months",
                            size: Responsive.isDesktop(context) ? 16 : 15,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 2,
                      ),

                      const Historytable(),
                      if (!Responsive.isDesktop(context))
                        const PaymentCardAndDetails(),
                    ],
                  ),
                ),
              ),
            ),

            // Flex 3, RIGHT SIDE
            if (Responsive.isDesktop(context))
              Flexible(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  height: SizeConfig.screenHeight,
                  color: AppColors.secondaryBg,
                  // margin: const EdgeInsets.symmetric(
                  //   horizontal: 40,
                  // ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 18.0,
                  ),
                  child: const SingleChildScrollView(
                    padding: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        // Action Bar, which is showing the calendar icon, notification icon and the profile picture with a dropdown icon
                        AppBarActionIcons(),
                        // The payment card showing the card picture, the recent activities and all other payment activities
                        PaymentCardAndDetails(),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PaymentInfoSlide extends StatelessWidget {
  const PaymentInfoSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}

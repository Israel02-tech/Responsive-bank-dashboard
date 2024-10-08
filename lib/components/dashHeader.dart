import 'package:flutter/material.dart';

import '../config/responsive.dart';
import '../style/colors.dart';
import '../style/textStyle.dart';

class DashHeader extends StatelessWidget {
  const DashHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                text: "Dashboard",
                size: Responsive.isDesktop(context) ? 30 : 26,
                fontWeight: FontWeight.w800,
              ),
              PrimaryText(
                text: "Payment update",
                size: Responsive.isDesktop(context) ? 16.0 : 14,
                fontWeight: FontWeight.w400,
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        //  Search Bar
        Expanded(
          flex: Responsive.isDesktop(context) ? 1 : 2,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.only(
                left: 40,
                right: 5.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: AppColors.black,
              ),
              hintText: "Search",
              hintStyle: const TextStyle(
                color: AppColors.secondary,
                fontSize: 14,
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../style/colors.dart';
import '../style/textStyle.dart';

class PaymentListTile extends StatelessWidget {
  final String? icon;
  final String? label;
  final String? amount;
  const PaymentListTile({
    super.key,
    required this.icon,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 0,
        right: 20.0,
      ),
      visualDensity: VisualDensity.standard,
      leading: Container(
        width: 50.0,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        // Icon
        child: SvgPicture.asset(
          icon!,
          width: 20,
        ),
      ),
      // Label
      title: PrimaryText(
        text: label!,
        size: 14.0,
        fontWeight: FontWeight.w600,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrimaryText(
            text: "Successfuly",
            size: 12.0,
            color: AppColors.secondary,
          ),
          // Amount
          PrimaryText(
            text: amount!,
            size: 16.0,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

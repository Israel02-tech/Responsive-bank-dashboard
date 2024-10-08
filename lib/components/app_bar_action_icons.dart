import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/responsive.dart';
import '../style/colors.dart';

class AppBarActionIcons extends StatelessWidget {
  const AppBarActionIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/date.svg",
            width: 20.0,
            height: 20.0,
          ),
        ),
        const SizedBox(width: 5.0),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/ring.svg",
            width: 20.0,
            height: 20.0,
          ),
        ),
        const SizedBox(width: 8.0),
        Row(
          children: [
            Container(
              margin: Responsive.isDesktop(context)
                  ? const EdgeInsets.only(right: 0)
                  : const EdgeInsets.only(right: 18),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859',
                ),
              ),
            ),
            // Icon(
            //   Icons.arrow_drop_down_outlined,
            //   color: AppColors.black,
            // ),
          ],
        )
      ],
    );
  }
}

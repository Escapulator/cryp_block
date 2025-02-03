import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/assets.dart';

class CoinCard extends StatelessWidget {
  final String assetName;
  final String title;
  final String subTitle;
  final String amount;
  final String trailing;
  final bool trend;
  const CoinCard(
      {super.key,
      required this.assetName,
      required this.title,
      required this.subTitle,
      required this.amount,
      required this.trailing,
      required this.trend});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 140.w,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
      margin: EdgeInsets.only(left: 12.w, right: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(assetName),
          SizedBox(height: 6.h),
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey),
          ),
          SizedBox(height: 3.h),
          FittedBox(
              child: Row(children: [
            SvgPicture.asset(
                trend ? AppAssets.arrowUpRight : AppAssets.arrowDownRight),
            SizedBox(width: 3.w),
            Text(
              trailing,
              style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: trend ? Color(0xFF12A633) : Color(0xFFC00F00),
                  fontWeight: FontWeight.w400),
            ),
          ]))
        ],
      ),
    );
  }
}

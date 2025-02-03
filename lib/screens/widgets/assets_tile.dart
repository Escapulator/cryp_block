import 'package:cypt_block/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetsTile extends StatelessWidget {
  final String assetName;
  final String title;
  final String subTitle;
  final String amount;
  final String trailing;
  final bool trend;
  const AssetsTile(
      {super.key,
      required this.assetName,
      required this.title,
      required this.subTitle,
      required this.trailing,
      required this.amount,
      required this.trend});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      minVerticalPadding: 0,
      leading: assetName.contains('.png')
          ? Image.asset(assetName, width: 40.r, height: 40.r, fit: BoxFit.fill)
          : SvgPicture.asset(assetName,
              width: 40.r, height: 40.r, fit: BoxFit.fill),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
          Text(
            amount,
            style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subTitle,
            style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: Color(0xFF9BA0A5),
                fontWeight: FontWeight.w400),
          ),
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

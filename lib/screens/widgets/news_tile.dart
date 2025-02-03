import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/assets.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              height: 73.h,
              width: 55.w,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(6.r)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.r),
                  child: Image.asset(AppAssets.muskElon))),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              width: 272.w,
              child: Text(
                  'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy'),
            ),
            SizedBox(height: 6.h),
            Text(
              'CoinDesk • 2h',
              style: GoogleFonts.inter(
                  color: Color(0xFF9BA0A5),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ])
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color color;
  final Widget? action;

  const CustomAppBar(
      {super.key, required this.title, required this.color, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: color,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(title,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            )));
    // AppBar(
    //     backgroundColor: color,
    //     elevation: 0,
    //     centerTitle: true,
    //     iconTheme: IconThemeData(
    //         color: useBlack! ? Colors.black : AppColors.textColor1(context),
    //         size: 24),
    //     title: Text(
    //       title,
    //       textScaler: TextScaler.linear(isFoldable ? 0.7 : 1.0),
    //       textAlign: TextAlign.center,
    //       style: switzer14.copyWith(
    //           fontSize: 16.sp, color: AppColors.textColor1(context)),
    //     ),
    //     actions: [action ?? const SizedBox()],
    //     systemOverlayStyle: systemOverlayStyle);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

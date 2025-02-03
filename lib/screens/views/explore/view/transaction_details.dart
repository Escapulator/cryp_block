import 'package:cypt_block/utils/assets.dart';
import 'package:cypt_block/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/model/blocks_model/block_transaction_model.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/details_tile.dart';

class TransactionDetails extends StatelessWidget {
  final Tx tx;
  const TransactionDetails({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        color: Colors.white,
        title: 'Transaction details',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: [
          DetailsTile(
            qey: 'Hash',
            value: tx.blockIndex.toString(),
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: 'Time',
            value: formatTimestamp(tx.time!),
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: 'Size',
            value: tx.size.toString(),
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: 'Block index',
            value: tx.blockIndex.toString(),
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: 'Height',
            value: tx.blockHeight.toString(),
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: 'Received time',
            value: formatTimestamp(tx.time!),
          ),
          SizedBox(height: 30.h),
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.zero,
            leading: SvgPicture.asset(AppAssets.externalLink),
            title: Text(
              'View on blockchain explorer',
              style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.95)),
            ),
            trailing: SvgPicture.asset(AppAssets.chevronRight),
          )
        ]),
      ),
    );
  }
}

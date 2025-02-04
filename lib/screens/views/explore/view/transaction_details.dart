import 'package:cypt_block/core/model/blocks_model/tezos_block.dart';
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
  final Tx? tx;
  final TezosBlockModel? block;
  final bool isBitcoin;
  const TransactionDetails(
      {super.key, required this.isBitcoin, this.tx, this.block});

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
            value: isBitcoin ? tx!.blockIndex.toString() : block!.hash!,
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: 'Time',
            value: isBitcoin
                ? formatTimestamp(tx!.time!)
                : formatDateTime(block!.timestamp),
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: isBitcoin ? 'Size' : 'Level',
            value: isBitcoin ? tx!.size.toString() : block!.level.toString(),
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: isBitcoin ? 'Block index' : 'Reward',
            value: isBitcoin
                ? tx!.blockIndex.toString()
                : block!.reward.toString(),
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: isBitcoin ? 'Height' : 'Bonus',
            value: isBitcoin
                ? tx!.blockHeight.toString()
                : block!.bonus.toString(),
          ),
          Divider(color: Colors.black.withOpacity(.08)),
          DetailsTile(
            qey: isBitcoin ? 'Received time' : 'Fees',
            value:
                isBitcoin ? formatTimestamp(tx!.time!) : block!.fees.toString(),
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

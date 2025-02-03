import 'package:cypt_block/core/services/myservices.dart';
import 'package:cypt_block/utils/helpers.dart';
import 'package:cypt_block/utils/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../../utils/assets.dart';
import '../../../widgets/custom_appbar.dart';
import '../view_model/explore_view_model.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive(
        viewModelBuilder: () => ExploreViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(
              color: Colors.white,
              title: 'BTC transactions',
            ),
            body: Consumer<MyServices>(builder: (context, snapshot, _) {
              return RefreshIndicator(
                  onRefresh: () async {
                    snapshot.transactions(snapshot.latestBlockModel.hash!);
                  },
                  child: ListView.separated(
                      physics: ClampingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      itemBuilder: (context, index) => InkResponse(
                            splashColor: Colors.transparent,
                            onTap: () {
                              model.navigationService.navigateTo(
                                  transactionDetailsRoute,
                                  arguments: snapshot
                                      .blockTransactionModel.tx![index]);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 300.w,
                                            child: Text(
                                              snapshot.blockTransactionModel
                                                  .tx![index].hash!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.inter(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          SvgPicture.asset(
                                              AppAssets.chevronRight,
                                              height: 24.r,
                                              width: 24.r)
                                        ]),
                                    SizedBox(height: 8.h),
                                    Text(
                                      formatTimestamp(snapshot
                                          .blockTransactionModel
                                          .tx![index]
                                          .time!),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(.56)),
                                    )
                                  ]),
                            ),
                          ),
                      separatorBuilder: (context, index) => Divider(
                          thickness: 1.w, color: Colors.black.withOpacity(0.1)),
                      itemCount: snapshot.blockTransactionModel.tx!.length));
            }),
          );
        });
  }
}

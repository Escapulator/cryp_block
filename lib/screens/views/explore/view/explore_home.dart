import 'package:cypt_block/core/services/myservices.dart';
import 'package:cypt_block/utils/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../../utils/assets.dart';
import '../../../widgets/assets_tile.dart';
import '../../../widgets/coin_card.dart';
import '../../../widgets/news_tile.dart';
import '../view_model/explore_view_model.dart';

class ExploreHome extends StatelessWidget {
  const ExploreHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExploreViewModel>.reactive(
        viewModelBuilder: () => ExploreViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Padding(
                padding: EdgeInsets.only(left: 16.w),
                child:
                    SvgPicture.asset(AppAssets.scan, height: 6.r, width: 6.r),
              ),
              title: Text('Explore'),
              centerTitle: true,
              actions: [
                SvgPicture.asset(AppAssets.search),
                SizedBox(width: 6.w),
                SvgPicture.asset(AppAssets.bellOutlined),
                SizedBox(width: 6.w),
              ],
            ),
            body: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(children: [
                      Text('My balance',
                          style: GoogleFonts.robotoSerif(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black.withOpacity(0.6))),
                      SizedBox(width: 6.w),
                      Icon(Icons.visibility,
                          color: Colors.black.withOpacity(0.6))
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text.rich(TextSpan(
                        text: '₦5,000',
                        style: GoogleFonts.robotoSerif(
                            fontSize: 32.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                              text: '.00',
                              style: GoogleFonts.robotoSerif(
                                  fontSize: 16.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700))
                        ])),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 2, color: Color(0xFFF2F3F7)),
                      ),
                    ),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'My assets',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          InkResponse(
                            splashColor: Colors.transparent,
                            onTap: () {},
                            child: Text(
                              'See all',
                              style: GoogleFonts.inter(
                                color: Color(0xFF12A633),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      ListView(
                          physics: ClampingScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          children: [
                            AssetsTile(
                              assetName: AppAssets.bitCoin,
                              title: 'Bitcoin',
                              subTitle: 'BTC',
                              amount: '₦24,500,00',
                              trailing: '1.76%',
                              trend: true,
                            ),
                            AssetsTile(
                              assetName: AppAssets.ethereumC,
                              title: 'Ethereum',
                              subTitle: 'ETH',
                              amount: '₦4,500,00',
                              trailing: '6.76%',
                              trend: false,
                            ),
                            AssetsTile(
                              assetName: AppAssets.tezos,
                              title: 'Tezos',
                              subTitle: 'XTZ',
                              amount: '₦4,500,00',
                              trailing: '9.06%',
                              trend: true,
                            ),
                          ]),
                    ]),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 175.h,
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 2, color: Color(0xFFF2F3F7)))),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Today’s Top Movers',
                                style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              InkResponse(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    context.read<MyServices>().hasTransactions
                                        ? model.navigationService
                                            .navigateTo(transactionsRoute)
                                        : model.getTransactionList(context);
                                  },
                                  child: Text(
                                    'See all',
                                    style: GoogleFonts.inter(
                                        color: Color(0xFF12A633),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ))
                            ]),
                      ),
                      SizedBox(height: 12.h),
                      Flexible(
                          child: ListView(
                              physics: ClampingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              children: [
                            CoinCard(
                              assetName: AppAssets.bitCoin,
                              title: 'Bitcoin',
                              subTitle: 'BTC',
                              amount: '₦24,500,00',
                              trailing: '1.76%',
                              trend: true,
                            ),
                            CoinCard(
                              assetName: AppAssets.ethereum,
                              title: 'Ethereum',
                              subTitle: 'ETH',
                              amount: '₦4,500,00',
                              trailing: '6.76%',
                              trend: false,
                            ),
                            CoinCard(
                              assetName: AppAssets.solana,
                              title: 'Solana',
                              subTitle: 'XTZ',
                              amount: '₦4,500,00',
                              trailing: '9.06%',
                              trend: true,
                            )
                          ])),
                    ]),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 2, color: Color(0xFFF2F3F7)),
                            bottom: BorderSide(
                                width: 2, color: Color(0xFFF2F3F7)))),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trending news',
                              style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            InkResponse(
                                splashColor: Colors.transparent,
                                onTap: () {},
                                child: Text(
                                  'View more',
                                  style: GoogleFonts.inter(
                                      color: Color(0xFF12A633),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ))
                          ]),
                      SizedBox(height: 16.h),
                      Image.asset(AppAssets.elonMuskPng),
                      SizedBox(height: 12.h),
                      Text(
                        'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                        style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
                  ),
                  Container(
                      height: 430.h,
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom != 0.0
                              ? MediaQuery.of(context).padding.bottom
                              : 20.h),
                      child: ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => NewsTile(),
                          separatorBuilder: (context, index) =>
                              Divider(color: Color(0xFFF2F3F7), thickness: 1),
                          itemCount: 4))
                ],
              ),
            ),
          );
        });
  }
}

import 'dart:async';
import 'package:cypt_block/utils/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/assets.dart';
import '../../utils/locator.dart';
import '../../utils/router/navigation_service.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  final NavigationService _navigationService = locator<NavigationService>();
  late AnimationController animationController;
  late Animation<double> animation;
  //final MyServices _MyServices = locator<MyServices>();
  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() async {
    //String? profile = await TinyDb.getString('profile') ?? '';
    // if (profile.isNotEmpty) {
    //   //run your desired function
    // } else {
    //   //navigate to either onBoarding screen or Login
    //   //_navigationService.navigateandRemoveRoute(onboardingRoute);
    // }
    _navigationService.navigateandRemoveRoute(loginRoute);
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);
    animation.addListener(() => setState(() {}));
    animationController.forward();
    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //chnage the bbackground color as required
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              //Change Image as required
              AppAssets.splashScreen,
            ),
          ],
        ),
      ),
    );
  }
}

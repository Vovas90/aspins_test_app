import 'dart:async';

import 'package:aspins_test_app/constants/colors.dart';
import 'package:aspins_test_app/constants/images.dart';
import 'package:aspins_test_app/constants/styles.dart';
import 'package:aspins_test_app/routing/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _percentage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AspinsColors.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(AspinsImages.splashTitle),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(AspinsImages.splashCircle),
                Text(
                  '$_percentage%',
                  style: Styles.text60w700,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _startLoading() {
    const oneSec = Duration(milliseconds: 50);
    _timer = Timer.periodic(oneSec, (Timer timer) {
      if (_percentage >= 100) {
        _timer.cancel();
        goTo(context, home, clearStack: true);
      } else {
        setState(() => _percentage++);
      }
    });
  }
}

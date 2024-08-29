import 'package:omogamo/views/home.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:omogamo/config/config.dart';
// import 'package:omogamo/views/home.dart';
import 'package:omogamo/utils/next_screen.dart';

class SplashPage extends StatefulWidget {
  SplashPage({required Key key}) : super(key: key);

  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  // afterSplash() {
  //   final SignInBloc sb = context.read<SignInBloc>();
  //   Future.delayed(Duration(milliseconds: 1500)).then((value) {
  //     sb.isSignedIn == true || sb.guestUser == true
  //         ? gotoHomePage()
  //         : gotoSignInPage();
  //   });
  // }

  gotoHomePage() {
    // final SignInBloc sb = context.read<SignInBloc>();
    // if (sb.isSignedIn == true) {
    //   sb.getDataFromSp();
    // }
    nextScreenReplace(context, Home());
  }

  gotoSignInPage() {
    nextScreenReplace(context, Home());
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: this,
    );
    _controller.forward();
    // afterSplash();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: RotationTransition(
          turns: Tween(begin: 0.0, end: 0.0).animate(_controller),
          child: Image(
            image: AssetImage(Config().splashIcon),
            height: 520,
            width: 420,
            fit: BoxFit.contain,
          )),
    ));
  }
}

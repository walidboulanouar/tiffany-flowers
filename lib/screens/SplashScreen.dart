import 'dart:async';

import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:ecomerceapp/screens/IntroScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController? _controller;
  bool _visible = false;
   Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) =>  HomeScreen()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) =>  IntroScreen()));
    }
  }


  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    _controller = VideoPlayerController.asset(
        videoPlayerOptions: VideoPlayerOptions(), "assets/videos/Final.mp4");

    _controller!.initialize().then((_) {
      _controller!.setLooping(false);
      // Timer(Duration(milliseconds: 100), () {
      setState(() {
        _controller!.play();
        _visible = true;
      });
    });
    // });

    Future.delayed(Duration(seconds: 9), () {
      checkFirstSeen();
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => IntroScreen()),
      // );
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 1000),
        child: AspectRatio(
            aspectRatio: 100.w / 100.h, child: VideoPlayer(_controller!)));
  }

  _getVideoBackground2() {
    return AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: VideoPlayer(_controller!));
  }

  _getBackgroundColor() {
    return Container(color: Colors.transparent //.withAlpha(120),
        );
  }

  _getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),

            // VideoPlayer(_controller!)
            100.w < 500 ? _getVideoBackground2() : Container(),
          ],
        ),
      ),
    );
  }
}

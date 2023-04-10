import 'package:flutter/material.dart';
import 'package:slide_animation/components/signup.dart';

import 'components/login.dart';
import 'components/onboard.dart';

class OnBoardingContet extends StatefulWidget {
  const OnBoardingContet({super.key});

  @override
  State<OnBoardingContet> createState() => _OnBoardingContetState();
}

class _OnBoardingContetState extends State<OnBoardingContet> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        pageController.hasClients ? pageController.page ?? 0 : 0;
    return SizedBox(
      height: 300 + progress * 100,
      child: Stack(
        children: [
          PageView(
            controller: pageController,
            children: const [OnBoard(), LoginContent(), SignUpContent()],
          ),
          Positioned(
            bottom: 20 + progress * 30,
            right: 20,
            child: Container(
              height: 45,
              width: 100 + progress * 20,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff7028e4), Color(0xffe5b2ca)]),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: progress <= 1 ? 1 - progress : 2 - progress,
                      child: const Center(
                          child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      )),
                    ),
                    Opacity(
                      opacity: progress > 0
                          ? progress > 1
                              ? 0
                              : progress
                          : 0,
                      child: const Center(
                        child: Text(
                          'Login',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Opacity(
                      opacity: progress > 1 ? 1 : 0,
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

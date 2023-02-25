import 'dart:async';

import 'package:flutter/material.dart';
import 'package:galaxy_planets/view/screens/home.dart';

void main() {
  runApp(
    const Screen(),
  );
}

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 2000),
      lowerBound: 0,
      upperBound: 1,
    );
    changescreen();
  }

  changescreen() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pushReplacement(
        // ignore: non_constant_identifier_names
        context,
        // ignore: non_constant_identifier_names
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            tween: Tween(begin: 0, end: 580),
            duration: const Duration(seconds: 2),
            curve: Curves.easeInOut,
            builder: (context, val, widget) {
              return Transform.translate(
                offset: Offset(0, 5),
                child: const Image(
                  image: AssetImage('assets/img/image-removebg-preview.png'),
                ),
              );
            },
          ),
          const Text("Work")
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const Details());
}

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 2000),
      lowerBound: 0,
      upperBound: 1,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> k =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          k['name'],
          style: const TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_circle_left_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 2 * pi),
                    duration: const Duration(seconds: 2),
                    child: Image(
                      image: AssetImage(k['img']),
                    ),
                    builder: (context, val, widget) {
                      return Transform.rotate(
                        angle: val,
                        child: widget,
                      );
                    }),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: Text(
                    k['details'],
                    style: const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }
}

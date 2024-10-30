import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [CenterCircularYellowProgress()],
      ),
      body: const Center(child:LinearProgressIndicator(
        backgroundColor: Colors.white,
      )),
    );
  }
}

class CenterCircularYellowProgress extends StatelessWidget {
  const CenterCircularYellowProgress({super.key});
  final redColor = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(
      color: redColor,
      strokeWidth: 10,
      value: 0.3,
      backgroundColor: Colors.white,
    ),
      );
  }
}
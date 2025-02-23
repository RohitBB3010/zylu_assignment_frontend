import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.4,
          child: const LoadingIndicator(
            colors: [Colors.red, Colors.amber, Colors.green],
            indicatorType: Indicator.ballGridBeat,
          ),
        ),
      ),
    );
  }
}

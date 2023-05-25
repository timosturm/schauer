import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  final Widget child;
  final String tag;

  const ForecastScreen({super.key, required this.child, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forecast")),
      body: Center(
        child: Hero(
          tag: tag,
          child: child,
        ),
      ),
    );
  }
}

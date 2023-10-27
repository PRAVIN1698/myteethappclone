import 'package:flutter/material.dart';

class SplashScreenwaiting extends StatelessWidget {
  const SplashScreenwaiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
      ),
      body: const Center(
        child: Text('Loading...'),
      ),
    );
  }
}

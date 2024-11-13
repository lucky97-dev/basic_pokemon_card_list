import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/app_image.jpeg',
                    height: 150, width: 150),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                ),
                SizedBox(height: 70),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

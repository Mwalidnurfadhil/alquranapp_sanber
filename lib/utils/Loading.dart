import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Al-Quran App',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.92),
              child: Text(
                "Development By Muhammad Walid Nur Fadhil",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.85),
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}

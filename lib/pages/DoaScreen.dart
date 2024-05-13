import 'package:flutter/material.dart';

class DoaScreen extends StatefulWidget {
  const DoaScreen({Key? key}) : super(key: key);

  @override
  State<DoaScreen> createState() => _DoaScreenState();
}

class _DoaScreenState extends State<DoaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00695C),
        centerTitle: true,
        title: Text(
          "Doa - Doa",
        ),
      ),
    );
  }
}

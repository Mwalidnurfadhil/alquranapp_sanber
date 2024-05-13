import 'package:flutter/material.dart';

class JadwalSholatSc extends StatefulWidget {
  const JadwalSholatSc({Key? key}) : super(key: key);

  @override
  State<JadwalSholatSc> createState() => _JadwalSholatScState();
}

class _JadwalSholatScState extends State<JadwalSholatSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00695C),
        centerTitle: true,
        title: Text(
          "Jadwal Sholat",
        ),
      ),
    );
  }
}

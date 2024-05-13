import 'package:final_project_alquranapp/controller/surahController.dart';
import 'package:final_project_alquranapp/model/surah.dart';
import 'package:final_project_alquranapp/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({Key? key}) : super(key: key);

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  final SurahController surahC = SurahController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00695C),
        title: Text('Surah'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Surah>>(
        future: surahC.getAllSurah(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text('Tidak ada data'),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Surah surah = snapshot.data![index];
              return ListTile(
                onTap: () {
                  Get.toNamed(RouteName.DETAIL_SURAH, arguments: surah);
                },
                leading: CircleAvatar(
                  child: Text('${surah.number}'),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal.shade800,
                ),
                title: Text('${surah.name?.transliteration?.id ?? 'Error..'}'),
                subtitle: Text(
                    '${surah.numberOfVerses} Ayat | ${surah.revelation?.id ?? 'Error..'}'),
                trailing: Text('${surah.name?.short ?? 'Error..'}'),
              );
            },
          );
        },
      ),
    );
  }
}

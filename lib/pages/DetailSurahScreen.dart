import 'package:final_project_alquranapp/controller/detailSurahController.dart';
import 'package:final_project_alquranapp/model/detail_surah.dart' as detail;
import 'package:final_project_alquranapp/model/surah.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailSurahScreen extends StatefulWidget {
  const DetailSurahScreen({Key? key}) : super(key: key);

  @override
  State<DetailSurahScreen> createState() => _DetailSurahScreenState();
}

class _DetailSurahScreenState extends State<DetailSurahScreen> {
  final Surah surah = Get.arguments;
  final DetailSurahController detSurahC = DetailSurahController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00695C),
        title: Text('Surah ${surah.name!.transliteration!.id}'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    '${surah.name!.transliteration!.id}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '( ${surah.name!.translation!.id} )',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${surah.numberOfVerses} Ayat | ${surah.revelation!.id}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder<detail.DetailSurah>(
              future: detSurahC.getDetailSurah(surah.number.toString()),
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
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.verses?.length ?? 0,
                  itemBuilder: (context, index) {
                    if (snapshot.data?.verses?.length == null) {
                      return SizedBox();
                    }
                    detail.Verse? ayat = snapshot.data?.verses?[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // CircleAvatar(
                                //   child: Text('${index + 1}'),
                                //   foregroundColor: Colors.white,
                                //   backgroundColor: Colors.teal.shade800,
                                // ),
                                Container(
                                  width: 40,
                                  height: 32,
                                  margin: EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF00695C),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      (index + 1).toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.bookmark_add_outlined),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.play_arrow),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${ayat!.text!.arab}",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 27,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${ayat.text?.transliteration?.en}",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "${ayat.translation!.id}",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}

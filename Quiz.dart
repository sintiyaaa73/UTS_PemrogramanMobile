//import library yang diperlukan
import 'package:flutter/material.dart';

void main() {
  runApp(
    QuizMaba(),
  );
}

class QuizMaba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Membuat aplikasi menggunakan MaterialApp
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: HalamanQuiz(),
          ),
        ),
      ),
    );
  }
}

class HalamanQuiz extends StatefulWidget {
  @override
  State<HalamanQuiz> createState() => _HalamanQuizState();
}

class _HalamanQuizState extends State<HalamanQuiz> {
  //Variabel untuk menyimpan skor dan jawaban
  List<Widget> skorMaba = [];
  List<String> pertanyaan = [
    //Daftar pertanyaan
    'Berapa jumlah prodi di Fakultas Vokasi ?',
    'Dimana kampus Unesa berada ?',
    'Apa nama Himpunan di jurusan Manajemen Informatika ?',
    'Berapa jumlah mahasiswa aktif angkatan 2022 jurusan Manajemen ?',
    'Siapa Kaprodi D4 Manajemen Informatika ?',
  ];
  List<String> jawabanA = [
    //Pilihan jawaban A
    '10',
    'Magetan',
    'Himti',
    '112',
    'Pak Agung',
  ];
  List<String> jawabanB = [
    //Pilihan jawaban B
    '15',
    'Malang',
    'Himafortic',
    '101',
    'Pak Hafiz',
  ];
  List<String> jawabanC = [
    //Pilihan jawaban C
    '20',
    'Surabaya',
    'Himtic',
    '94',
    'Pak Andi',
  ];
  List<String> jawabanD = [
    //Pilihan jawaban D
    '25',
    'Suramadu',
    'Himafo',
    '203',
    'Pak Dodik',
  ];
  List<String> kunciJawaban = [
    //Kunci jawaban
    '10',
    'Surabaya',
    'Himafortic',
    '94',
    'Pak Dodik',
  ];
  int nomorPertanyaan = 0;
  int skor = 0;

  @override
  Widget build(BuildContext context) {
    //Membuat tata letak column untuk menampilkan quiz
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                //Menampilkan pertanyaan
                pertanyaan[nomorPertanyaan],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        //Tombol jawaban A
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(
                jawabanA[nomorPertanyaan],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                _cekJawaban(jawabanA[nomorPertanyaan]);
              },
            ),
          ),
        ),
        //Tombol jawaban B
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(
                jawabanB[nomorPertanyaan],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                _cekJawaban(jawabanB[nomorPertanyaan]);
              },
            ),
          ),
        ),
        //Tombol jawaban C
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(
                jawabanC[nomorPertanyaan],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                _cekJawaban(jawabanC[nomorPertanyaan]);
              },
            ),
          ),
        ),
        //Tombol jawaban D
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(
                jawabanD[nomorPertanyaan],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                _cekJawaban(jawabanD[nomorPertanyaan]);
              },
            ),
          ),
        ),
        //Skor pengguna dan tombol quiz
        Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.grey.shade700,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Menampilkan skor pengguna
              Text(
                'Skor: $skor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              //Tombol untuk menghentikan quiz
              ElevatedButton(
                onPressed: nomorPertanyaan < pertanyaan.length - 1 ? null : _stopQuiz,
                child: Text(
                  'Stop Quiz',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Fungsi untuk memeriksa jawaban dan mengupdate skor
  void _cekJawaban(String jawaban) {
    setState(() {
      if (jawaban == kunciJawaban[nomorPertanyaan]) {
        skorMaba.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        skor++;
      } else {
        skorMaba.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }
      if (nomorPertanyaan < pertanyaan.length - 1) {
        nomorPertanyaan++;
      } else {
        _stopQuiz(); // Panggil fungsi untuk menghentikan quiz
      }
    });
  }

  //Fungsi untuk menampilkan dialog saat quiz selesai
  void _stopQuiz() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Quiz Selesai'),
          content: Text('Skor Anda: $skor'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  nomorPertanyaan = 0;
                  skor = 0;
                  skorMaba.clear();
                  Navigator.of(context).pop();
                });
              },
              child: Text('Ulangi Quiz'),
            ),
          ],
        );
      },
    );
  }
}

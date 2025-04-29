import 'package:flutter/material.dart';

class DetailPelanggan extends StatelessWidget {
  final String nama;
  final String email;
  final String noHp;
  final String alamat;
  final String provinsi;
  final String kodePos;

  const DetailPelanggan({
    super.key,
    required this.nama,
    required this.email,
    required this.noHp,
    required this.alamat,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(184, 39, 29, 109),
        title: Text('Detail $nama',
        style: TextStyle(
          color: Colors.white
        ),
        ),
        leading: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.arrow_back, color: Colors.white)),
      ),
    );
  }
}

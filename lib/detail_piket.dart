import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPiket extends StatelessWidget {
  final Map<String, dynamic> piket;
  const DetailPiket({
    super.key,
    required this.piket});

  String _formatTanggal(DateTime tanggal) {
    String hari = DateFormat('EEEE', 'id_ID').format(tanggal);
    String bulan = DateFormat('MMMM', 'id_ID').format(tanggal);
    return '$hari, ${tanggal.day} $bulan ${tanggal.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(184, 39, 29, 109),
        title: Text(
          'Detail ${piket['tugas']}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, piket);
            FocusScope.of(context).unfocus();
          },
          icon: Icon(Icons.arrow_back,
          color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatTanggal(piket['tanggal']),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color:  Color.fromARGB(184, 39, 29, 109),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(184, 39, 29, 109),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text(piket['nama'],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  )),
                )
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(184, 39, 29, 109),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                piket['tugas'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

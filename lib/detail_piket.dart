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
    return Scaffold();
  }
}

import 'package:flutter/material.dart';

class DetailTransaksi extends StatelessWidget {
  final String email;
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final int jumlah;
  final int harga;
  final int total;

  const DetailTransaksi({
    super.key,
    required this.email,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlah,
    required this.harga,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

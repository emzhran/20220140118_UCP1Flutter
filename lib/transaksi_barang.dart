import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class TransaksiBarang extends StatefulWidget {
  const TransaksiBarang({super.key});

  @override
  State<TransaksiBarang> createState() => _TransaksiBarangState();
}

class _TransaksiBarangState extends State<TransaksiBarang> {
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String? dateError;

  final Map<String, int> jenisHargaBarang = {
    'Carrier': 30000,
    'Sleeping Bag': 15000,
    'Tenda': 35000,
    'Sepatu': 25000,
  };

  String? selectedJenisTransaksi;
  String? selectedJenisBarang;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', '').then((_) {
      Intl.defaultLocale = 'id_ID';
    });
  }

    Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateError = null;
      });
    }
  }

    String _formatTanggal(DateTime? date) {
    if (date == null) return 'Pilih tanggal';
    return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(date);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

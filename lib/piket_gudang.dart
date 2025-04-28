import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_file.dart';

class PiketGudang extends StatefulWidget {
  final String email;
  const PiketGudang({super.key, required this.email});

  @override
  State<PiketGudang> createState() => _PiketGudangState();
}

class _PiketGudangState extends State<PiketGudang> {
  final TextEditingController tugasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  String? dateError;
  List<Map<String, dynamic>> listPiket = [];

  void _tambahDataPiket() {
    if (!_formKey.currentState!.validate() || selectedDate == null) {
      setState(() {
        dateError = selectedDate == null ? 'Tanggal tidak boleh kosong' : null;
      });
      return;
    }
    setState(() {
      String displayName = widget.email;
      listPiket.add({
        'nama': displayName,
        'tanggal': selectedDate,
        'tugas': tugasController.text,
      });
      tugasController.clear();
      selectedDate = null;
      dateError = null;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

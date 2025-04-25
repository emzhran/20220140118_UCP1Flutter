import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomorHpController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController konfirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(184, 171, 165, 211),
              Color.fromARGB(158, 204, 196, 234),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('./assets/image/AreiLogo.png'),
                      width: 230,
                      height: 100,
                      ), 
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child:  Text(
                    'DAFTAR AKUN BARU',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextFormField(
                    controller: namaLengkapController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.black),
                      hintText: 'Nama Lengkap',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Lengkap tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

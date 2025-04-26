import 'package:flutter/material.dart';
import 'package:ucp1_118/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool _isObscure = true;

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('./assets/image/AreiLogo.png'),
                      width: 230,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'SELAMAT DATANG KEMBALI',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.black),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.black),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.black,
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(email: emailController.text,)),
                        );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(184, 39, 29, 109),
                        fixedSize: const Size(400, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'MASUK',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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

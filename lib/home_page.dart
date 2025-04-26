import 'package:flutter/material.dart';
import 'package:ucp1_118/login_page.dart';

class HomePage extends StatelessWidget {
  final String email;

  const HomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    String displayName = email;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color.fromARGB(184, 39, 29, 109),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Image(
                        image: AssetImage('./assets/image/donatello.png'),
                        width: 55,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Selamat Datang",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.logout, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ClipRRect(
                child: Container(
                  color: Colors.grey[300],
                  height: 200,
                  child: Center(
                    child: Image(
                      image: AssetImage('./assets/image/Arei.png'),
                      fit: BoxFit.cover,
                      height: 250,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

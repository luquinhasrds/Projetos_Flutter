import 'package:flutter/material.dart';
import 'package:projeto_2/HomePage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  child: Image.network(
                      'https://wallpapers.com/images/hd/shrek-4k-candid-and-surprised-dlflew3w2nn9ijjj.jpg'),
                ),
                Container(height: 20,),
                TextField(
                  onChanged: (text) {
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (email == "lucas-rsantos@outlook.com" &&
                        password == "123") {
                      print("correto");
                      Navigator.of(context).pushReplacementNamed('home');
                    } else {
                      print("incorreto");
                    }
                  },
                  child: Text("Entrar"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

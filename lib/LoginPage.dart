import 'package:demo_1/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final TextEditingController name = TextEditingController();
    final TextEditingController pass = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color.fromRGBO(61, 67, 81, 100),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Log In ',
                      style: TextStyle(
                        fontFamily: "Poppins-Bold",
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username is incorrect';
                        } else if (name.text.trim() != 'aadhil') {
                          return 'Username is incorrect';
                        }
                        return null;
                      },
                      controller: name,
                      decoration: InputDecoration(
                          hoverColor: Colors.white38,
                          prefixIcon: const Icon(
                            Icons.account_circle_outlined,
                            size: 30,
                          ),
                          hintText: "Enter your Username",
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is incorrect';
                        } else if (pass.text.trim() != '1234') {
                          return 'Password is incorrect';
                        }
                        return null;
                      },
                      controller: pass,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "Enter your Password",
                          hintStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            if (name.text.trim() == 'aadhil' &&
                                pass.text.trim() == '1234') {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              await prefs.setBool('islogin', true);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      margin: EdgeInsets.all(10),
                                      backgroundColor: Colors.red,
                                      content: Text(
                                          "Incorrect username or password ")));
                            }
                          }
                        },
                        child: const Text('Login'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:demo_1/LoginPage.dart';
import 'package:demo_1/apple.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> list = ['Apple ', 'Samsung', 'Xiaomi', 'Oneplus'];
    final List<String> listimages = [
      'assets/apple-logo.png',
      'assets/samsung-logo.png',
      'assets/mi.png',
      'assets/oneplus-logo.png'
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context1) {
                            return AlertDialog(
                              title: const Text('Are You Sure!?'),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setBool('islogin', false);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginPage()),
                                      (Route<dynamic> route) => false,
                                    );
                                  },
                                  child: const Text('YES'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context1);
                                  },
                                  child: const Text('NO!!'),
                                )
                              ],
                            );
                          });
                    },
                    child: const Text('Sign Out'))
              ],
            )
          ],
        ),
        body: SafeArea(
            child: Container(
                color: const Color.fromRGBO(61, 67, 81, 100),
                child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Apple(list[index]);
                              }));
                            },
                            child: ListTile(
                              leading: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: ClipRRect( 
                                    borderRadius: index % 2 == 0
                                        ? BorderRadius.circular(25)
                                        : BorderRadius.circular(0),
                                    child: Container(
                                        color: Colors.amber,
                                        child: Image.asset(listimages[index])),
                                  )),
                              title: Text(list[index]),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      );
                    }))));
  }
}

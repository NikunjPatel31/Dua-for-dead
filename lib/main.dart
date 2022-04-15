import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Screens/PrayerScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

int _value = 1;

class _HomePageState extends State<HomePage> {
  String buttonTitle = "Language";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.yellow,
          body: Container(
            color: Colors.green,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PrayerScreen(
                                          language: _value,
                                        )));
                          },
                          child: Container(
                            color: Colors.blue,
                            height: 100,
                            child: const Center(
                              child: Text(
                                'Prayer',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return MyDialog();
                                });
                          },
                          child: Container(
                            color: Colors.pink,
                            height: 100,
                            child: const Center(
                              child: Text(
                                "Language",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.purple,
                          height: 100,
                          child: const Center(
                            child: Text(
                              'Share',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

Widget _myRadioButton(
    {required String title,
    required int value,
    required Function(int?) onChanged}) {
  return RadioListTile(
    value: value,
    groupValue: _value,
    onChanged: onChanged,
    title: Text(title),
  );
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//   String buttonTitle = 'Language';
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class MyDialog extends StatefulWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  State<MyDialog> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height * 0.37
              : MediaQuery.of(context).size.height * 0.20,
          horizontal: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.27
              : MediaQuery.of(context).size.width * 0.38),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Container(
        child: Column(
          children: [
            RadioListTile(
              title: const Text('English'),
              value: 1,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = value as int;
                });
              },
            ),
            RadioListTile(
              title: const Text('Gujarati'),
              value: 2,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = value as int;
                });
              },
            ),
            RadioListTile(
              title: const Text('Hindi'),
              value: 3,
              groupValue: _value,
              onChanged: (value) {
                setState(() {
                  _value = value as int;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

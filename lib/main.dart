import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'showmessage.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController();
  String name = '';

  @override
  void initState() {
    controller.text = 'start';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter the text'),
            ),
            ElevatedButton(
                onPressed: () {
                  save(controller.text);
                },
                child: Text("Save")),
            ElevatedButton(
                onPressed: () {
                  ShowData();
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Display(name)));
                },
                child: Text("Show Data"))
          ],
        ),
      ),
    );
  }

  void save(String text) async {
    var sharedPre = await SharedPreferences.getInstance();
    sharedPre.setString('key-name', text);
  }

  void ShowData() async {
    var sharedPre = await SharedPreferences.getInstance();
    var text = sharedPre.getString('key-name');

    setState(() {
      this.name = text ?? '';
    });
  }
}

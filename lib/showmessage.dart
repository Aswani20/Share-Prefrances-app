import 'package:flutter/material.dart';


class Display extends StatelessWidget{

  var  content;
  Display(this.content);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$content',
            ),
            Center(child: ElevatedButton(onPressed: () {Navigator.pop(context);}, child: Text("Go Back")))
          ],
        ),
      ),
    );
  }

}

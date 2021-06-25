import 'package:favorite_plant_apps/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var fontFamily = 'Poppins';
Color a = Color(0xff25C266);
Color b = Color(0xff37dc9a);
Color c = Color(0xff33333F);
Color d = Color(0xff8E8E93);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final myController = TextEditingController();
  bool _validate = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width - 64;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                child: Container(
              child: Text(
                "Let's Plant for Our Earth",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
            Flexible(
                child: Container(
              child: Text(
                "make your green come true",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )),
            SizedBox(
              height: 32,
            ),
            Flexible(
                flex: 3,
                child: Container(
                  child: ClipRRect(
                    child: Image.asset('images/green-girl.jpg'),
                  ),
                )),
            SizedBox(
              height: 64,
            ),
            Flexible(
                child: Container(
                    width: itemWidth,
                    child: Text(
                      "Enter Your Name",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ))),
            SizedBox(
              height: 12,
            ),
            Flexible(
                child: Container(
                    child: TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: 'How Can We Call You?',
                errorText: _validate ? 'Name Can\'t Be Empty' : null,
                labelStyle: TextStyle(color: a),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: a),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: a),
                ),
              ),
              style: TextStyle(fontSize: 16, color: Colors.black),
            ))),
            SizedBox(
              height: 16,
            ),
            Flexible(
                child: Container(
              height: 50,
              width: itemWidth,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: b),
                child: Text(
                  'CONTINUE',
                  style: TextStyle(
                      fontFamily: fontFamily,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (myController.text.isEmpty) {
                    setState(() {
                      _validate = true;
                    });
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      _validate = false;
                      return MainScreen(text: myController.text);
                    }));
                  }
                },
              ),
            ))
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}

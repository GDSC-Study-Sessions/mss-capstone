import 'package:flutter/material.dart';
import 'package:my_flutter/homepage.dart';

class FormLoginRoute extends StatefulWidget {
  FormLoginRoute();

  @override
  FormLoginRouteState createState() => new FormLoginRouteState();
}

class FormLoginRouteState extends State<FormLoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        brightness: Brightness.dark,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(150),
            child: Container(
              padding: const EdgeInsets.fromLTRB(60, 15, 0, 25),
              alignment: Alignment.bottomLeft,
              constraints: BoxConstraints.expand(height: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Memariya App",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Container(height: 10),
                  const Text(
                    "Transform Your Future with the Power of our Development Learning App!",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        child: Align(
          child: SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(height: 50),
                const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                Container(height: 5),
                const TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password (optional)"),
                ),
                Container(height: 5),
                Row(
                  children: <Widget>[
                    Checkbox(
                        value: false,
                        onChanged: (value) {},
                        materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap),
                    Text("Remember me",
                        style: TextStyle(color: Colors.grey[800])),
                  ],
                ),
                Container(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0))),
                    child: const Text(
                      "LOGIN",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => homepage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

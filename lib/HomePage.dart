import 'Start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  String name;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("Start");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        name = user.displayName;
        this.isloggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: !isloggedin
          ? CircularProgressIndicator()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 70.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(
                          "Hello $name !",
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: Image(
                      image: AssetImage("images/welcome.jpg"),
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 80,
                      child: Card(
                        elevation: 5,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 30,
                              width: 50,
                              child: Center(
                                child: Text(
                                  'New',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Innerworth',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Mind over markets series',
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Text(
                          "Continue reading",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      child: Card(
                        color: Colors.lightGreen.shade50,
                        elevation: 5,
                        borderOnForeground: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  child: Text(
                                    "Module:",
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                    text: TextSpan(
                                        text: '01  |',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                        children: <TextSpan>[
                                      TextSpan(
                                          text: '  Stock Market Basics',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.black))
                                    ])),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Level: ',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: 'Beginner',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black))
                                        ])),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: RichText(
                                        text: TextSpan(
                                            text: 'Chapter: ',
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black),
                                            children: <TextSpan>[
                                          TextSpan(
                                              text: 'O1',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black))
                                        ])),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              new LinearPercentIndicator(
                                //width: MediaQuery.of(context).size.width - 80,
                                animation: true,
                                lineHeight: 5.0,
                                animationDuration: 2500,
                                percent: 0.5,
                                //linearStrokeCap: LinearStrokeCap.roundAll,
                                progressColor: Colors.green,
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width / 3,
                          child: Image(
                            image: AssetImage("images/web.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Let's begin this journey by\nsetting your daily goal",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: <Widget>[
                              RaisedButton(
                                onPressed: () {
                                  print('Button Clicked');
                                },
                                child: Text('Set a goal'),
                                color: Colors.white,
                                elevation: 5,
                                textColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              RaisedButton(
                                onPressed: () {
                                  print('Button Clicked');
                                },
                                child: Text('Progress'),
                                color: Colors.white,
                                elevation: 5,
                                textColor: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                ),
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
    ));
  }
}

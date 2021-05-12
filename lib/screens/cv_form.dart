import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ipvp/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:ipvp/widgets/background.dart';
import 'package:ipvp/services/auth.dart';

class Cvform extends StatefulWidget with NavigationStates {
  @override
  _CvformState createState() => _CvformState();
}

class _CvformState extends State<Cvform> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // Variable declaration\
  String name = '';
  String email = '';
  String sscScore = '';
  String firstYear = '';
  String secondYear = '';
  String thirdYear = '';
  String technical = '';
  String other = '';
  String achievement = '';
  String projects = '';
  // error variable for safe side
  // String error = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    addCvInfo(data) {
      CollectionReference collectionReference =
          Firestore.instance.collection('cv-info');
      // this line push data to that firebase collection/table
      collectionReference.add(data);
      // if (result == null) {
      //   setState(() {
      //     error = 'Something went wrong !! Retry';
      //   });
      // }
    }

    return Scaffold(
      body: Background(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "RESUME",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "Name"),
                  onChanged: (val) {
                    setState(() => name = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "Email Id"),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                "Academic Section",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA)),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "SSC Score"),
                  onChanged: (val) {
                    setState(() => sscScore = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "1st year score"),
                  onChanged: (val) {
                    setState(() => firstYear = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "2nd year score"),
                  onChanged: (val) {
                    setState(() => secondYear = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(labelText: "3rd year score"),
                  onChanged: (val) {
                    setState(() => thirdYear = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                "Skills/Strengths",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA)),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(labelText: "Technical"),
                  onChanged: (val) {
                    setState(() => technical = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(labelText: "Others"),
                  onChanged: (val) {
                    setState(() => other = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(labelText: "Achievements"),
                  onChanged: (val) {
                    setState(() => achievement = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(labelText: "Projects"),
                  onChanged: (val) {
                    setState(() => projects = val);
                  },
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      Map<String, dynamic> data = {
                        "user": _auth.user,
                        "name": name,
                        "email": email,
                        "sscScore": sscScore,
                        "firstYear": firstYear,
                        "secondYear": secondYear,
                        "thirdYear": thirdYear,
                        "technical": technical,
                        "other": other,
                        "achievement": achievement,
                        "projects": projects
                      };
                      addCvInfo(data);
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41)
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "MAKE",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              // Container(
              //   alignment: Alignment.centerRight,
              //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              //   child: GestureDetector(
              //     onTap: () => {
              //       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ipvp/screens/cv_form.dart';
import 'package:ipvp/widgets/background.dart';
import 'package:ipvp/services/auth.dart';

class DisplayCvForm extends StatefulWidget {
  @override
  _DisplayCvFormState createState() => _DisplayCvFormState();
}

class _DisplayCvFormState extends State<DisplayCvForm> {
  final AuthService _auth = AuthService();
  List data;

  fetchData() async {
    CollectionReference collectionReference =
        Firestore.instance.collection('cv-info');
    QuerySnapshot query = await collectionReference
        .where("user", isEqualTo: _auth.user)
        .getDocuments();

    setState(() => data = query.documents);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
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
            Text(
              "Name : " + data[0]["name"].toString(),
              style: TextStyle(fontSize: 12, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Email Id : " + data[0]["email"].toString(),
              style: TextStyle(fontSize: 12, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Academic Section",
              style: TextStyle(fontSize: 12, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "10th score : " + data[0]["sscScore"].toString(),
              style: TextStyle(fontSize: 10, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "1st year score : " + data[0]["firstYear"].toString(),
              style: TextStyle(fontSize: 10, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "2nd year score : " + data[0]["secondYear"].toString(),
              style: TextStyle(fontSize: 10, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "3rd year score : " + data[0]["thirdYear"].toString(),
              style: TextStyle(fontSize: 10, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Skills/Strengths",
              style: TextStyle(fontSize: 12, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Technical : " + data[0]["technical"].toString(),
              style: TextStyle(fontSize: 10, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Others : " + data[0]["other"].toString(),
              style: TextStyle(fontSize: 10, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Achievement : " + data[0]["achievement"].toString(),
              style: TextStyle(fontSize: 12, color: Color(0xFF2661FA)),
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              "Projects : " + data[0]["projects"].toString(),
              style: TextStyle(fontSize: 12, color: Color(0xFF2661FA)),
            ),

            SizedBox(height: size.height * 0.05),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cvform()));
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
                    "EDIT",
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
    );
  }
}

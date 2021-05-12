import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:ipvp/pages/Students.dart';
import 'package:ipvp/widgets/AppBar.dart';

class List1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
    child: ClipPath(
    clipper: Appbar(),
    child: Container(
    child: Padding(
    padding: const EdgeInsets.only(left: 90, top: 100, bottom: 10),
    child: Row(
    children: <Widget>[
    Padding(
    padding: const EdgeInsets.only(right: 20),
    child: IconButton(icon:
    Icon(
    Icons.arrow_back_ios,
    color: Colors.black87,
    ),
    iconSize: 30,
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Students()));
    }
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(bottom: 0),
    child: Text('Computer Engg.',
    style: TextStyle(
    color: Colors.black87,
    fontSize: 38,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    ],
    ),
    ),
    color: Colors.cyan[300],
    ),
    ),
    ),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 100, left: 10, right: 10),
              child: ExpansionCard(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text('CO5I-A',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110, left: 200),
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => null));
                    },
                      child: Text('View Students',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
                background: Image(
                  image: AssetImage('assets/A.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ExpansionCard(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text('CO5I-B',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110, left: 200),
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => null));
                    },
                      child: Text('View Students',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
                background: Image(
                  image: AssetImage('assets/B.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 100),
              child: ExpansionCard(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text('CO5I-C',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110, left: 200),
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => null));
                    },
                      child: Text('View Students',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                ],
                background: Image(
                  image: AssetImage('assets/C.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

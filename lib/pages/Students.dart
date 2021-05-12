import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:ipvp/StudentList/List1.dart';
import 'package:ipvp/StudentList/List2.dart';
import 'package:ipvp/StudentList/List3.dart';
import 'package:ipvp/bloc/navigation_bloc/Navigations.dart';
import 'package:ipvp/screens/Teacher-page.dart';
import 'package:ipvp/widgets/AppBar.dart';

class Students extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ClipPath(
          clipper: Appbar(),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 100, top: 100, bottom: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: IconButton(icon:
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black87,
                    ),
                        iconSize: 30,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarLayout()));
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Text('Class List',
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
      backgroundColor: Colors.black ,
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
                    Text('Computer Engingg.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110, left: 200),
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => List1()));
                    },
                      child: Text('View Classes',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black26,
                      ),
                    ),
                  ),
                ],
                background: Image.network('https://images.unsplash.com/photo-1533134486753-c833f0ed4866?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmxhY2slMjBhYnN0cmFjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: ExpansionCard(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text('IT Engineering',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110, left: 200),
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => List2()));
                    },
                      child: Text('View Classes',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black26,
                      ),
                    ),
                  ),
                ],
                background: Image.network('https://images.unsplash.com/photo-1533134486753-c833f0ed4866?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmxhY2slMjBhYnN0cmFjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 100),
              child: ExpansionCard(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 10),
                    Text('Electronics Engg.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 110, left: 200),
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => List3()));
                    },
                      child: Text('View Classes',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black26,
                      ),
                    ),
                  ),
                ],
                background: Image.network('https://images.unsplash.com/photo-1533134486753-c833f0ed4866?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmxhY2slMjBhYnN0cmFjdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

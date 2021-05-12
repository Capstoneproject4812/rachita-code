import 'package:flutter/material.dart';
import 'package:ipvp/screens/Teacher-page.dart';
import 'package:ipvp/widgets/AppBar.dart';
import '../bloc/navigation_bloc/Navigations.dart';

class MyAccount extends StatelessWidget with NavigationStates{
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
                    padding: const EdgeInsets.only(right: 70),
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
                    padding: const EdgeInsets.only(top: 3),
                    child: Text('My Account',
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
            color: Colors.amber[700],
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 220,
              width: 150,
              child: Stack(
                clipBehavior: Clip.none, fit: StackFit.expand,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/pic-2.jpg"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
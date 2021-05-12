import 'package:flutter/material.dart';
import 'package:ipvp/bloc/navigation_bloc/Navigations.dart';
import 'package:ipvp/screens/Teacher-page.dart';
import 'package:ipvp/widgets/AppBar.dart';

class YourActivity extends StatelessWidget with NavigationStates {
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
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text('Your Activity',
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
            color: Colors.green[600],
          ),
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}
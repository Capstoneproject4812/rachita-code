import 'package:flutter/material.dart';
import 'package:ipvp/DashBoard/HomePage.dart';
import 'package:ipvp/SideBarWork/AB.dart';
import 'package:ipvp/bloc/navigation_bloc/navigation_bloc.dart';

class MyAccount extends StatelessWidget with NavigationStates {
  const MyAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ClipPath(
          clipper: Appbar(),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 90, top: 100, bottom: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: IconButton(icon:
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black87,
                    ),
                        iconSize: 30,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text('Account',
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
            color: Colors.amber,
          ),
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}


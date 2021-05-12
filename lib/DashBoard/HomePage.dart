import 'package:flutter/material.dart';
import 'package:ipvp/DashBoard/Apply%20for%20Companies.dart';
import 'package:ipvp/DashBoard/Applied%20Companies.dart';
import 'package:ipvp/DashBoard/Assessment.dart';
import 'package:ipvp/SideBarWork/AB.dart';
import 'package:ipvp/ToDoHome/todomain.dart';
import 'package:ipvp/bloc/navigation_bloc/navigation_bloc.dart';



class HomePage extends StatelessWidget with NavigationStates{
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new MaterialButton(
                        height: 120.0,
                        minWidth: 110.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.black87,
                        child: new Text("Apply for Commpanies"),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ApplyC()),
                          )
                        },
                        splashColor: Colors.blue,
                      )),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new MaterialButton(
                        height: 120.0,
                        minWidth: 110.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.black87,
                        child: new Text("AppliedCompanies"),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AppliedC()),
                          )
                        },
                        splashColor: Colors.blue,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new MaterialButton(
                        height: 120.0,
                        minWidth: 110.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.black87,
                        child: new Text("Student Assessmment"),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Assessmment()),
                          )
                        },
                        splashColor: Colors.blue,
                      )),
                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: new MaterialButton(
                        height: 120.0,
                        minWidth: 110.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.black87,
                        child: new Text("To-Do Task"),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Todo()),
                          )
                      
                        },
                        splashColor: Colors.blue,
                      )),
                ],
              ),

            ],
          )),
    );
  }
}





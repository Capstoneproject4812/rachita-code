import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipvp/SideBarWork/AB.dart';
import 'package:ipvp/bloc/navigation_bloc/navigation_bloc.dart';

class AppliedC extends StatefulWidget with NavigationStates {
  @override
  _AppliedCState createState() => _AppliedCState();
}

// class _AppliedC extends State<AppliedC>

class _AppliedCState extends State<AppliedC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ClipPath(
          clipper: Appbar(),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 230, top: 80, bottom: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      'IPVP',
                      style: TextStyle(
                        fontFamily: 'Raleway Regular',
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      iconSize: 35,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.red[600],
          ),
        ),
      ),
      body: Container(),
    );
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipvp/SideBarWork/AB.dart';

class ApplyC extends StatefulWidget {
  @override
  _ApplyCState createState() => _ApplyCState();
}

class _ApplyCState extends State<ApplyC> {
  Query _ref;
  String status = '';
  String name = '';
  String type = '';
  String details = '';

  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('Companies');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Companies')
        .orderByChild('name');
  }

  Widget _buildCompItem({Map company}) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        padding: EdgeInsets.only(left: 26, right: 10, bottom: 20),
        height: 300,
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.apartment,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    company['name'],
                    style: TextStyle(
                      fontFamily: 'Nunito Regular',
                      fontSize: 27,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.book_online_outlined,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    company['type'],
                    style: TextStyle(
                      fontFamily: 'Nunito Regular',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.receipt,
                    color: Colors.black,
                    size: 15,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    company['details'],
                    maxLines: 5,
                    style: TextStyle(
                      fontFamily: 'Nunito Regular',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    _showDeleteDialog(company: company);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.subdirectory_arrow_right_rounded,
                        color: Colors.green[300],
                      ),
                      Text(
                        'Apply',
                        style: TextStyle(
                          fontFamily: 'Nunito Regular',
                          fontSize: 20,
                          color: Colors.green[300],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showDeleteDialog({Map company}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Apply for ${company['name']}'),
            content: Text(
              'Are you sure you want to Apply?',
              style: TextStyle(
                  fontFamily: 'Nunito Regular',
                  fontSize: 19,
                  color: Colors.black),
            ),
            actions: [
              TextButton(
                child: Text(
                  'Yes',
                  style: TextStyle(
                      fontFamily: 'Nunito Regular',
                      fontSize: 18,
                      color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  reference
                      .child(company['key'])
                      .remove()
                      .whenComplete(() => Navigator.pop(context));
                },
                child: Text(
                  'No',
                  style: TextStyle(
                      fontFamily: 'Nunito Regular',
                      fontSize: 18,
                      color: Colors.black),
                ),
              )
            ],
          );
        });
  }

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
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map company = snapshot.value;
            company['key'] = snapshot.key;
            return _buildCompItem(company: company);
          },
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}

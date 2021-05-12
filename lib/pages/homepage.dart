import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ipvp/bloc/navigation_bloc/Navigations.dart';
import 'package:ipvp/widgets/AddComps.dart';
import 'package:ipvp/widgets/AppBar.dart';
import 'package:ipvp/widgets/EditComps.dart';

class Homepage extends StatefulWidget with NavigationStates{
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Query _ref;
  DatabaseReference reference = FirebaseDatabase.instance.reference().child('Companies');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference()
    .child('Companies')
    .orderByChild('name');
  }

  Widget _buildCompItem({Map company}){
    Color typeColor = getTypeColor(company['type']);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        padding: EdgeInsets.only(left: 26, right: 10, bottom: 20),
        height: 260,
        color: Colors.black26,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(children: [
                Icon(Icons.apartment,
                  color: Colors.white,
                  size: 15,),
                SizedBox(width: 10,),
                Text(company['name'],
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 5,top: 10),
              child: Row(children: [
                Icon(Icons.book_online_outlined,
                  color: Colors.white,
                  size: 15,),
                SizedBox(width: 10),
                Text(company['type'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: typeColor,
                  ),
                ),
              ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 50,top: 10),
              child: Row(children: [
                Icon(Icons.receipt,
                  color: Colors.white,
                  size: 15,),
                SizedBox(width: 10,),
                Text(company['details'],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder:(_)=>EditComps(
                            compKey: company['key'],
                          )
                      )
                      );
                    },
                  child: Row(children: [
                    Icon(Icons.edit,
                      color: Colors.amber,
                    ),
                    Text('Edit',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.amber,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40,),
                  ],),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: (){
                    _showDeleteDialog(company: company);
                  },
                  child: Row(children: [
                    Icon(Icons.delete,
                      color: Colors.red,
                    ),
                    Text('Delete',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 6,),
                  ],),
                ),
                SizedBox(width: 20,),
              ],
            ),
          ],
        ),
      ),
    );
  }


  _showDeleteDialog({Map company}){
    showDialog(context: context, builder: (context){
      return AlertDialog(title: Text('Delete ${company['name']}'),
        content: Text('Are you sure you want to delete?'),
        actions: [
          TextButton(
          onPressed:(){
          Navigator.pop(context);
        },
          child: Text('Cancel'),),
          TextButton(
            onPressed:(){
              reference
                  .child(company['key'])
                  .remove()
                  .whenComplete(() => Navigator.pop(context));
            },
            child: Text('Delete'),)
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
              padding: const EdgeInsets.only(left: 240, top: 80, bottom: 20),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text('IPVP',
                style: TextStyle(
                color: Colors.black87,
                fontSize: 38,
                fontWeight: FontWeight.bold,
                ),
                ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: IconButton(
                      icon: Icon(Icons.search,
                        color: Colors.black87,
                      ),
                      iconSize: 35,
                      onPressed: (){},
                    ),
                  ),
              ],
              ),
            ),
            color: Colors.red[600],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return AddComps();
          }));
        },
        elevation: 10,
        child: const Icon(Icons.work_sharp,
        color: Colors.red,
        ),
        tooltip: 'Add Company',
        backgroundColor: Colors.black87,
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.black87,
        child: Container(
          height: 60,
        ),
      ),
       body: Container(
         height: double.infinity,
         child: FirebaseAnimatedList(
           query: _ref,
           itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double>animation,int index){
             Map company = snapshot.value;
             company['key'] = snapshot.key;
             return _buildCompItem(company: company);
           },),
         ),
      backgroundColor: Colors.black87,
       );
  }
  Color getTypeColor(String type){
    Color color = Theme.of(context).accentColor;

    if (type == 'Cloud Computing') {
      color = Colors.deepPurple;
    }
    if (type == 'Networking') {
      color = Colors.pinkAccent;
    }
    if (type == 'Computer Hardware') {
      color = Colors.red;
    }
    if (type == 'Computer Specialist') {
      color = Colors.lightGreenAccent;
    }
    if (type == 'Computer Science') {
      color = Colors.amber;
    }
    if (type == 'IT management') {
      color = Colors.pink[600];
    }
    return color;
    }
  }


import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ipvp/widgets/AppBar.dart';
// ignore: must_be_immutable
class EditComps extends StatefulWidget {
  String compKey;
  EditComps({this.compKey});

  @override
  _EditCompsState createState() => _EditCompsState();
}

class _EditCompsState extends State<EditComps> {

  TextEditingController _compName, _compDetails;
  String _typeSelected ='';

  DatabaseReference _ref;

  @override
  void initState(){
    super.initState();
    _compName = TextEditingController();
    _compDetails = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Companies');
    getCompDetail();
  }
  Widget _buildCompType(String title){
    return InkWell(
        child: Container(
          height: 40,
          width: 200,

          decoration: BoxDecoration(
            color: _typeSelected == title? Colors.black : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),

          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 7.5),
              child: Text(title,style: TextStyle(fontSize: 23,
                  color: Colors.pink[300], fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        onTap: (){
          setState(() {
            _typeSelected = title;
          });
        }
    );
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
              padding: const EdgeInsets.only(left: 150, top: 100 , bottom: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text('Edit Company',
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
            color: Colors.pink[400],
          ),
        ),
      ),
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 130, left: 23, right: 23,),
                child: TextFormField(
                  cursorHeight: 30,
                  controller: _compName,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink[400]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: 'Company Name*',
                    labelStyle: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[400]),
                    hintText: 'Enter Company name',
                    hintStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.pink[400],
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 25),
                      child: Icon(Icons.add_business,
                        color: Colors.pink[400],size: 30,),
                    ),
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 23, right: 23),
                child: TextFormField(
                  controller: _compDetails,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink[400]),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: 'Details*',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.pink[400]),
                    hintText: 'Enter Company Details',
                    hintStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.pink[400],
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 20,right:25),
                      child: Icon(Icons.receipt_long_rounded,
                        size: 30,
                      color: Colors.pink[400],
                      ),
                    ),
                    fillColor: Colors.black,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Container(
                  height: 300,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      _buildCompType('Cloud Computing'),
                      SizedBox(height: 20),
                      _buildCompType('Networking'),
                      SizedBox(height: 20),
                      _buildCompType('Computer Hardware'),
                      SizedBox(height: 20),
                      _buildCompType('Computer Specialist'),
                      SizedBox(height: 20),
                      _buildCompType('Computer Science'),
                      SizedBox(height: 20),
                      _buildCompType('IT management'),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                    child: Text('Update Company',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    primary: Colors.pink[400],
                    elevation: 10,
                      onPrimary: Colors.yellow,
                    ),
                    onPressed: (){
                      saveComp();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getCompDetail() async {
    DataSnapshot snapshot = await _ref.child(widget.compKey).once();

    Map company = snapshot.value;

    _compName.text = company['name'];
    _compDetails.text = company['details'];

    setState(() {
      _typeSelected = company['type'];
    });
  }
  void saveComp(){
    String name = _compName.text;
    String details = _compDetails.text;
    Map<String,String> company = {
      'name':name,
      'details':details,
      'type':_typeSelected,
    };
    _ref.child(widget.compKey).update(company).then((value){
      Navigator.pop(context);
    });
  }
}


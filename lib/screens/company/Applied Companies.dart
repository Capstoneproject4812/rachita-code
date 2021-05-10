import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ipvp/SideBarWork/AB.dart';
// import 'package:ipvp/bloc/navigation_bloc/navigation_bloc.dart';

class AppliedC extends StatefulWidget {
  @override
  _AppliedCState createState() => _AppliedCState();
}

class _AppliedCState extends State<AppliedC> {
  List data;

  fetchData() async {
    CollectionReference collectionReference =
        Firestore.instance.collection('cv-info');
    QuerySnapshot query = await collectionReference
        .where("status", isEqualTo: "applied")
        .getDocuments();

    setState(() => data = query.documents);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Widget _buildCompItem({Map application}) {
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
                    application['name'],
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
                    application['type'],
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
                    application['details'],
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 100,
          color: Colors.yellow,
        )
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(120),
//         child: ClipPath(
//           clipper: Appbar(),
//           child: Container(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 230, top: 80, bottom: 20),
//               child: Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(left: 28),
//                     child: Text('IPVP',
//                       style: TextStyle(
//                         fontFamily: 'Raleway Regular',
//                         color: Colors.white,
//                         fontSize: 38,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: IconButton(
//                       icon: Icon(Icons.search,
//                         color: Colors.white,
//                       ),
//                       iconSize: 35,
//                       onPressed: () {},
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             color: Colors.red[600],
//           ),
//         ),
//       ),
//       body: Container(),
//     );
//   }
// }

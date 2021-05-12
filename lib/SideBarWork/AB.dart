import 'package:flutter/material.dart';

class AB1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => null));
                        }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text('Review Report',
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
            color: Colors.pink,
          ),
        ),
      ),
      backgroundColor: Colors.black87,
    );
  }
}


class Appbar extends CustomClipper<Path>{
@override
Path getClip(Size size) {
var path = new Path();
path.lineTo(0, size.height-50);
var controlPoint = Offset(50, size.height);
var endPoint = Offset(size.width/2, size.height);
path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
path.lineTo(size.width, size.height);
path.lineTo(size.width, 0);
return path;
}
@override
bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
return true;
}
}


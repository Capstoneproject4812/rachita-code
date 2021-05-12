import 'package:flutter/material.dart';
// import 'package:ipvp/SideBarWork/sidebar_layout.dart';
import 'package:ipvp/models/user.dart';
import 'package:ipvp/screens/authenticate/authentication.dart';
import 'package:ipvp/screens/home/home.dart';
import 'package:ipvp/screens/cv_form.dart';
import 'package:ipvp/DashBoard/HomePage.dart';
import 'package:ipvp/pages/homepage.dart' as teacher;
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return home or Authentciation Widget
    if (user == null) {
      return Authenticate();
    } else {
      if (user == 'TmAYSzSzbMW6b4TZK11zzPffuL92') {
        return teacher.Homepage();
      } else {
        return HomePage();
      }
      // return Home();
    }
  }
}

import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:ipvp/models/user.dart';
import 'package:ipvp/screens/wrapper.dart';
import 'package:ipvp/services/auth.dart';
import 'package:provider/provider.dart';

// import './screens/login-page.dart';
// import './screens/cv_form.dart';
// import './screens/report_std.dart';
void main() {
  runApp(Ipvp());
}

class Ipvp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(), // will have Wrapper() here
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF2661FA),
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // title: 'LoginPage',
      ),
    );
  }
}

// return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'LoginPage',
//       theme: ThemeData(
//         textTheme:
//             GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: ReportStd(), // will have Wrapper() here
//       routes: {'/cvform': (_) => CVPage()},
//     );

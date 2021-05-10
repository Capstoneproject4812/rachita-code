import 'package:flutter/material.dart';
import 'package:ipvp/services/auth.dart';
import 'package:ipvp/widgets/AppBar.dart';
import 'package:ipvp/palette.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: ClipPath(
          clipper: Appbar(),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 90, top: 30, bottom: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black87,
                      ),
                      iconSize: 30,

                      onPressed: () async {
                        await _auth.signOut();
                      },
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => SideBarLayout()));
                      // }
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Review Report',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            color: Colors.blue,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 50,
                child: Center(
                  child: Text(
                    'Report Submission',
                    style: Heading,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: RoundedButton2(
                  buttonText: 'Upload File',
                  // onPressed: () async {
                  //   FilePickerResult result =
                  //   await FilePicker.platform.pickFiles();
                  //   if (result != null) {
                  //   print(result.files.single.name);
                  //   File file = File(result.files.single.path);
                  //   }
                  //   include ':app'

                  //   def localPropertiesFile = new File(rootProject.projectDir, "local.properties")
                  //   def properties = new Properties()

                  //   assert localPropertiesFile.exists()
                  //   localPropertiesFile.withReader("UTF-8") { reader -> properties.load(reader) }

                  //   def flutterSdkPath = properties.getProperty("flutter.sdk")
                  //   assert flutterSdkPath != null, "flutter.sdk not set in local.properties"
                  //   apply from: "$flutterSdkPath/packages/flutter_tools/gradle/app_plugin_loader.gradle"
                  // },
                  // onPressed: () async { new FilePickerDemo(); return null; }
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Upload your weekly internship report here',
                      )
                    ]),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  RoundedButton(
                    buttonText: 'Send',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Scaffold(
  //       backgroundColor: Colors.blue[50],
  //       appBar: AppBar(
  //         title: Text('Ipvp'),
  //         backgroundColor: Colors.blue[400],
  //         elevation: 0.0,
  //         actions: <Widget>[
  //           TextButton.icon(
  //             icon: Icon(Icons.person),
  //             label: Text('logout'),
  //             onPressed: () async {
  //               await _auth.signOut();
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.buttonText,
    Null Function() onPressed,
  }) : super(key: key);
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class RoundedButton2 extends StatelessWidget {
  const RoundedButton2({
    Key key,
    @required this.buttonText,
    Future Function() onPressed,
  }) : super(key: key);
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[700],
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

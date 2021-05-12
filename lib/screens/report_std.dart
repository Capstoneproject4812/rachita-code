import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ipvp/bloc/navigation_bloc/navigation_bloc.dart';

class ReportStd extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Image.asset('assets/report_sub.png'),
          SizedBox(
            height: 30,
          ),
          Text(
            'Upload your weekly internship report here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36),
                    ),
                    color: Colors.brown[900],
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'Select',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36)),
                    color: Colors.orangeAccent[400],
                    onPressed: () async {
                      FilePickerResult result =
                          await FilePicker.platform.pickFiles();
                      if (result != null) {
                        print(result.files.single.name);
                        File file = File(result.files.single.path);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'Upload',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          // LoginAndRegister(), ye remove ji
          // LoginWithFacebook()
        ],
      ),
    );
  }
}

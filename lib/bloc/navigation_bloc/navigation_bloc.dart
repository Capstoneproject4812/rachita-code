import 'package:bloc/bloc.dart';
import 'package:ipvp/pages/EditP.dart';
import 'package:ipvp/DashBoard/HomePage.dart';
import 'package:ipvp/pages/MyAccount.dart';
import 'package:ipvp/pages/Settings.dart';
import 'package:ipvp/screens/cv_form.dart';
import 'package:ipvp/screens/cv_2.dart';
import 'package:ipvp/screens/report_std.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  EditProfileClickedEvent,
  SettingsClickedEvent,
  ReportClickedEvent,
  CvFormClickedEvent,
  CvDisplayClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(HomePage());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccount();
        break;
      case NavigationEvents.EditProfileClickedEvent:
        yield EditP();
        break;
      case NavigationEvents.SettingsClickedEvent:
        yield SPage();
        break;
      case NavigationEvents.ReportClickedEvent:
        yield ReportStd();
        break;
      case NavigationEvents.CvFormClickedEvent:
        yield Cvform();
        break;
      case NavigationEvents.CvDisplayClickedEvent:
        yield DisplayCvForm();
        break;
    }
  }
}

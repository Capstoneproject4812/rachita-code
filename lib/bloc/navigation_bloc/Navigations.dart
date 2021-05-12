import 'package:bloc/bloc.dart';
import 'package:ipvp/pages/ReviewReport.dart';
import 'package:ipvp/pages/Students.dart';
import 'package:ipvp/pages/YourActivity.dart';
import 'package:ipvp/pages/homepage.dart';
import 'package:ipvp/pages/myaccountpage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  YourActivityClickedEvent,
  ReviewReportClickedEvent,
  StudentsClickedEvent,
}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(Homepage());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Homepage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccount();
        break;
      case NavigationEvents.YourActivityClickedEvent:
        yield YourActivity();
        break;
      case NavigationEvents.ReviewReportClickedEvent:
        yield ReviewReport();
        break;
      case NavigationEvents.StudentsClickedEvent:
        yield Students();
        break;
    }
  }
}
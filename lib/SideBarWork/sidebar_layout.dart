import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ipvp/SideBarWork/sidebar.dart';
import 'package:ipvp/bloc/navigation_bloc/navigation_bloc.dart';


class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NavigationStates initialState;
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(initialState),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}
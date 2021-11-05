import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hacker/models/story.dart';
import 'package:hacker/screens/home_screen.dart';
import 'package:hacker/screens/job_screen.dart';
import 'package:hacker/screens/webview_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../webservice.dart';

class AppContainer extends StatefulWidget {
  AppContainerState createState() => AppContainerState();
}

class AppContainerState extends State<AppContainer> {
  late int _index = 0;
  final List _widgets = [HomeScreen(), JobScreen()];
  void setWidget(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'News Stories',
            icon: FaIcon(FontAwesomeIcons.newspaper),
          ),
          BottomNavigationBarItem(
              label: 'Jobs', icon: FaIcon(FontAwesomeIcons.userTie)),
        ],
        onTap: setWidget,
        currentIndex: _index,
      ),
    );
  }
}

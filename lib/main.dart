import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hacker/controller/stories_cubit.dart';
import 'package:hacker/screens/app_container.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/job_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          /*
          TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 5,
          
          */
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
              elevation: 5.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(color: Colors.black)),
          textTheme:
              GoogleFonts.noticiaTextTextTheme(Theme.of(context).textTheme)),
      home: MultiBlocProvider(
          providers: [
            BlocProvider<StoriesCubit>(
                create: (BuildContext context) => StoriesCubit()..getStories()),
            BlocProvider<JobCubit>(
              create: (BuildContext context) => JobCubit()..getJobs(),
            )
          ],
          child: Container(
            child: AppContainer(),
          )),
    );
  }
}

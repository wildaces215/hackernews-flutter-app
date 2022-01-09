// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hacker/controller/job_cubit.dart';
import 'package:hacker/models/job.dart';
import 'package:hacker/screens/webview_screen.dart';

import '../webservice.dart';

class JobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //late List;
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'Jobs',
              style: TextStyle(),
            ),
            titleTextStyle: Theme.of(context).textTheme.headline6),
        body: BlocBuilder<JobCubit, List<Job>>(builder: (context, jobs) {
          if (jobs.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(jobs[index].title));
              });
        }));
  }
}

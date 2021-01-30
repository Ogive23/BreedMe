import 'package:flutter/material.dart';

class ConsultationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // Add the app bar and list of items as slivers in the next steps.
      slivers: <Widget>[
      SliverAppBar(
      // pinned: true,
      floating: true,
      backgroundColor: Colors.white,
      elevation: 1.0,
      forceElevated: true,
      iconTheme: IconThemeData(color: Colors.black),
      title: Text(
        'Consultations',
        style: TextStyle(color: Colors.black),
      ),
    ),SliverList(
      delegate: SliverChildListDelegate.fixed([
        Container(
          color: Colors.red,
        ),
      ]),
    )]);
  }
}

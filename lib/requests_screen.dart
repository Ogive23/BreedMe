import 'package:flutter/material.dart';

class RequestsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        Container(
          color: Colors.blue,
        ),
      ]),
    );
  }
}

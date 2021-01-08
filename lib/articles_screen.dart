import 'package:flutter/material.dart';

class ArticlesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        Container(
          color: Colors.deepOrange,
        ),
      ]),
    );
  }
}

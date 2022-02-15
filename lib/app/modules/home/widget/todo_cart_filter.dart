import 'package:flutter/material.dart';

class TodoCartFilter extends StatefulWidget {
  @override
  State<TodoCartFilter> createState() => _TodoCartFilterState();
}

class _TodoCartFilterState extends State<TodoCartFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 120,
        maxWidth: 150,
      ),
    );
  }
}

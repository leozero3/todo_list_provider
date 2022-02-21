import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.grey)]),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          leading: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
          title: Text(
            'Descrição da TASK',
            style: TextStyle(
              decoration: false ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            '20/10/2021',
            style: TextStyle(
              decoration: false ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ),
    );
  }
}

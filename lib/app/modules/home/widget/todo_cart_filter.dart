import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';

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
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.primaryColor,
        border: Border.all(
          width: 1,
          color: Colors.grey.withOpacity(.8),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            '10 TASKS',
            style:
                context.titleStyle.copyWith(fontSize: 10, color: Colors.white),
          ),
          Text(
            'Hoje',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          LinearProgressIndicator(
            backgroundColor: context.primaryColorLight,
            value: 0.4,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        ],
      ),
    );
  }
}

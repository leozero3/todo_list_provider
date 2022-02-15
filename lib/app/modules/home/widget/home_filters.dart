import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/modules/home/widget/todo_cart_filter.dart';

class HomeFilters extends StatefulWidget {
  @override
  State<HomeFilters> createState() => _HomeFiltersState();
}

class _HomeFiltersState extends State<HomeFilters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('FILTROS', style: context.titleStyle),
        SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TodoCartFilter(),
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.red, width: 100, height: 100),
              Container(color: Colors.red, width: 100, height: 100),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/models/total_tasks_model.dart';

class TodoCartFilter extends StatelessWidget {
  final String label;
  final TaskFilterEnum taskFilter;
  final TotalTasksModel? totalTasksModel;
  final bool selected;

  //final int totalTasksFinish;

  const TodoCartFilter({
    Key? key,
    required this.label,
    required this.taskFilter,
    this.totalTasksModel,
    required this.selected,
  }) : super(key: key);

  double _getPercentFinish() {
    final total = totalTasksModel?.totalTasks ?? 00;
    final totalfinish = totalTasksModel?.totalTasksFinish ?? 0.1;

    if (total == 0) {
      return 0.0;
    }
    final percent = (totalfinish * 100) / total;
    return percent / 100;
  }

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
        color: selected ? context.primaryColor : Colors.white,
        border: Border.all(
          width: 1,
          color: Colors.grey.withOpacity(.8),
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Text(
            '${totalTasksModel?.totalTasks ?? 0} Tasks',
            style:
                context.titleStyle.copyWith(fontSize: 10, color: Colors.white),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: _getPercentFinish()),
            duration: Duration(seconds: 1),
            builder: (context, value, child) {
              return LinearProgressIndicator(
                backgroundColor: context.primaryColorLight,
                value: value,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              );
            },
          )
        ],
      ),
    );
  }
}

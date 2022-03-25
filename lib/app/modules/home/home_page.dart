import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/notifier/default_listener_notifier.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/ui/todo_list_icons_icons.dart';
import 'package:todo_list_provider/app/models/task_filter_enum.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_drawer.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_filters.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_header.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_tasks.dart';
import 'package:todo_list_provider/app/modules/home/widget/home_week_filter.dart';
import 'package:todo_list_provider/app/modules/tasks/tasks_module.dart';

class HomePage extends StatefulWidget {
  final HomeController _homeController;

  HomePage({Key? key, required HomeController homeController})
      : _homeController = homeController,
        super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(changeNotifier: widget._homeController).listener(
        context: context,
        successCallback: (notifier, listenerInstance) {
          listenerInstance.dispose();
        });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      widget._homeController.loadTotalTasks();
      widget._homeController.findTasks(filter: TaskFilterEnum.today);
    });
  }

  Future<void> _goToCreateTask(BuildContext context) async {
    await Navigator.of(context).push(PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.easeInQuad);
        return ScaleTransition(
          scale: animation,
          alignment: Alignment.bottomRight,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return TaskModule().getPage('/task/create', context);
      },
    ));
    widget._homeController.refreshPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: const Color(0xFFFAFBFE),
        elevation: 0,
        actions: [
          PopupMenuButton(
            icon: Icon(TodoListIcons.filter),
            onSelected: (value) {
              widget._homeController.showOrHideFinishingTask();
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<bool>(
                value: true,
                child: Text(
                    '${widget._homeController.showFinishingTasks ? 'Esconder' : 'Mostrar'} Tarefas concluidas'),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        onPressed: () => _goToCreateTask(context),
        child: Icon(Icons.add),
      ),
      backgroundColor: const Color(0xFFFAFBFE),
      drawer: HomeDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeekFilter(),
                      HomeTasks(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/modules/todo_list_module.dart';
import 'package:todo_list_provider/app/modules/tasks/task_create_controller.dart';
import 'package:todo_list_provider/app/modules/tasks/task_create_page.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository.dart';
import 'package:todo_list_provider/app/repositories/tasks/tasks_repository_impl.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service.dart';

import '../../services/tasks/tasks_service_impl.dart';

class TaskModule extends TodoListModule {
  TaskModule()
      : super(bindings: [
          Provider<TasksRepository>(
            create: (context) => TaskRepositoryImpl(
              sqliteConnectionFactory: context.read(),
            ),
          ),
          Provider<TasksServices>(
            create: (context) => TasksServicesImpl(
              tasksRepository: context.read(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => TaskCreateController(
              tasksServices: context.read(),
            ),
          )
        ], routers: {
          '/task/create': (context) => TaskCreatePage(
                controller: context.read(),
              ),
        });
}

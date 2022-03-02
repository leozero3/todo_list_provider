import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service.dart';

class TaskCreateController extends DefaultChangeNotifier{

  final TasksServices _tasksServices;
  DateTime? _selectedDate;


  TaskCreateController({required TasksServices tasksServices
}): _tasksServices = tasksServices;

}
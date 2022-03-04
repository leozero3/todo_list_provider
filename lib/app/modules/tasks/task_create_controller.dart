import 'package:todo_list_provider/app/core/notifier/default_change_notifier.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service.dart';

class TaskCreateController extends DefaultChangeNotifier {
  final TasksServices _tasksServices;
  DateTime? _selectedDate;

  TaskCreateController({required TasksServices tasksServices})
      : _tasksServices = tasksServices;

  set selectedDate(DateTime? selectedDate) {
    resetState();
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  Future<void> save(String description) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      if (_selectedDate != null) {
        await _tasksServices.save(_selectedDate!, description);
      } else {
        setError('Data da Task não selecionada');
      }
    } catch (e, s) {
      print(e);
      print(s);
      setError('Erro ao cadastrar Task');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/modules/tasks/task_create_controller.dart';
import 'package:todo_list_provider/app/modules/tasks/widget/calendar_button.dart';
import 'package:validatorless/validatorless.dart';

class TaskCreatePage extends StatelessWidget {
  final TaskCreateController _controller;
  final descriptionEC = TextEditingController();

  TaskCreatePage({Key? key, required TaskCreateController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: context.primaryColor,
          label: Text(
            'Salvar Task',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Criar Atividade',
                style: context.titleStyle.copyWith(fontSize: 20),
              ),
            ),
            SizedBox(height: 30),
            TodoListField(label: '',controller: descriptionEC, validator: Validatorless.required('Descrição é obrigatoria'),),
            SizedBox(height: 20),
            CalendarButton(),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/services/app_widget.dart';

class AppMudule extends StatelessWidget {
  const AppMudule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider(create: (_) => Object())],
      child: AppWidget(),
    );
  }
}

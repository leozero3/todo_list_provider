
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

abstract class TodoListModule {
  final Map<String,WidgetBuilder> _router;
  final List<SingleChildStatefulWidget>? _bindings;

  TodoListModule(this._router, this._bindings);
}
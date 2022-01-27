import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/exception/auth_exception.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class RegisterController extends ChangeNotifier {
  final UserService _userService;
  String? error;
  bool sucess = false;

  RegisterController({required UserService userService})
      : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      error = null;
      sucess = false;
      notifyListeners();
      final user = await _userService.register(email, password);
      if (user != null) {
        sucess = true;
      } else {
        error = 'Erro ao registrar Usuario';
        notifyListeners();
      }
    } on AuthException catch (e) {
      error = e.message;
    } finally {
      notifyListeners();
    }
  }
}

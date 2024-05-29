import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';

import '../../../domain/usecases/load_users_use_case.dart';

enum PageStatus { initial, loading, success, failed }

class UserPageViewModel extends ChangeNotifier {
  final LoadUsersUseCase _loadUsersUseCase;
  UserPageViewModel({required LoadUsersUseCase loadUsersUseCase, int? page})
      : _loadUsersUseCase = loadUsersUseCase,
        _pageStatus = PageStatus.initial,
        _currentPage = page ?? 1,
        _users = [];
  PageStatus _pageStatus;
  PageStatus get pageStatus => _pageStatus;
  final List<User> _users;
  List<User> get users => _users;
  int _currentPage;
  int get currentPage => _currentPage;
  bool _hasReachedEnd = false;
  bool get hasReachedEnd => _hasReachedEnd;
  String? _statusMessage;
  String get statusMessage => _statusMessage ?? "";

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      _users.clear();
      _currentPage = 0;
      _hasReachedEnd = false;
    }
    if (_hasReachedEnd) return;
    _pageStatus = PageStatus.loading;
    notifyListeners();

    final result = await _loadUsersUseCase(limit: 10, skip: _users.length);
    if (result.status) {
      _currentPage++;
      var data = result.data;
      _users.addAll(data!);
      _pageStatus = PageStatus.success;
      _hasReachedEnd = data.isEmpty;
      notifyListeners();
    } else {
      _pageStatus = PageStatus.failed;
      _statusMessage = result.message;
      notifyListeners();
    }
  }
}

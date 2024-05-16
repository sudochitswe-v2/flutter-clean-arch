import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entities/user_entity.dart';
import '../../../../presentation/pages/users_page/users_page_view_model.dart';
import '../../../../presentation/pages/users_page/widgets/user_item_loading_widget.dart';
import '../../../../presentation/pages/users_page/widgets/user_item_widget.dart';

class ContentWidget extends StatefulWidget {
  const ContentWidget({super.key});

  @override
  State<ContentWidget> createState() => _ContentWidgetState();
}

class _ContentWidgetState extends State<ContentWidget> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isButton) {
      context.read<UserPageViewModel>().fetchUsers();
    }
  }

  bool get _isButton {
    if (!_scrollController.hasClients) return false;
    final max = _scrollController.position.maxScrollExtent;
    final current = _scrollController.offset;
    return current >= (max * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    final users =
        context.select<UserPageViewModel, List<User>>((value) => value.users);
    final hasEnd =
        context.select<UserPageViewModel, bool>((value) => value.hasReachedEnd);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: RefreshIndicator(
        onRefresh: () =>
            context.read<UserPageViewModel>().fetchUsers(isRefresh: true),
        child: ListView.builder(
          key: const ValueKey("users_key"),
          controller: _scrollController,
          itemCount: hasEnd ? users.length : users.length + 1,
          itemBuilder: (context, index) {
            if (index >= users.length) {
              return !hasEnd ? const UserItemLoadingWidget() : const SizedBox();
            }
            final user = users[index];
            return UserItem(user: user);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}

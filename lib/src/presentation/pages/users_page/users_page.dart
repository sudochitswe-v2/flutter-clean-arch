import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../src/presentation/pages/users_page/users_page_view_model.dart';
import '../../../../src/presentation/pages/users_page/widgets/content_widget.dart';

class UserPage extends StatefulWidget {
  static const String routeName = "users";
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserPageViewModel>().fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageState =
        context.select<UserPageViewModel, PageStatus>((vm) => vm.pageStatus);
    final length =
        context.select<UserPageViewModel, int>((value) => value.users.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: switch (pageState) {
        PageStatus.initial => const Center(
            child: CircularProgressIndicator(),
          ),
        PageStatus.loading => length == 0
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : const ContentWidget(),
        PageStatus.success => const ContentWidget(),
        PageStatus.failed => Center(
            child: Text(context.watch<UserPageViewModel>().statusMessage),
          )
      },
    );
  }
}

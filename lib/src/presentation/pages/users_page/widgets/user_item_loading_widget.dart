import 'package:flutter/material.dart';

class UserItemLoadingWidget extends StatelessWidget {
  const UserItemLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

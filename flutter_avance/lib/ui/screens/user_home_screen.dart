import 'package:flutter/material.dart';

abstract class IUserHomeViewModel {
  String get email;
}

class UserHomeScreen extends StatelessWidget {
  final IUserHomeViewModel viewModel;
  const UserHomeScreen(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(children: [
        Text(
          viewModel.email,
          style: Theme.of(context).textTheme.displayMedium,
        )
      ]),
    );
  }
}

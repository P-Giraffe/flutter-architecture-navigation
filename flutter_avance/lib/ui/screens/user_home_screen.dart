import 'package:flutter/material.dart';
import 'package:flutter_avance/data/model/award.dart';

abstract class IUserHomeViewModel extends ChangeNotifier {
  String get email;
  List<Award> get userAwards;
  bool get isLoading;

  void userTouchedSettingsButton();
  void userTouchedLogoutButton();
}

class UserHomeScreen extends StatelessWidget {
  final IUserHomeViewModel viewModel;
  const UserHomeScreen(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            viewModel.email,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Expanded(
              child: AnimatedBuilder(
                  animation: viewModel,
                  builder: (context, _) {
                    if (viewModel.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.separated(
                          itemBuilder: _awardCellBuilder,
                          separatorBuilder: (_, index) => const Divider(),
                          itemCount: viewModel.userAwards.length);
                    }
                  })),
          ElevatedButton.icon(
              onPressed: viewModel.userTouchedSettingsButton,
              icon: const Icon(Icons.settings),
              label: const Text("Settings")),
          OutlinedButton(
              onPressed: viewModel.userTouchedLogoutButton,
              child: const Text("Logout")),
        ]),
      ),
    );
  }

  Widget _awardCellBuilder(BuildContext context, int index) {
    final award = viewModel.userAwards[index];
    return ListTile(
        title: Text(award.title), trailing: Text(award.year.toString()));
  }
}

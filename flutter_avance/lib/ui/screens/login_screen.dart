import 'package:flutter/material.dart';
import 'package:flutter_avance/ui/screens/login_viewmodel.dart';

class LoginScreen extends StatelessWidget {
  final LoginViewModel _viewModel;
  const LoginScreen(this._viewModel, {Key? key}) : super(key: key);

  _loggedInButtonPressed() {}

  @override
  Widget build(BuildContext context) {
    final errorMessage = _viewModel.errorMessage;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [
                AutofillHints.username,
                AutofillHints.email
              ],
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              obscureText: true,
              autofillHints: const [AutofillHints.password],
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 8),
            if (_viewModel.isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Center(
                child: ElevatedButton(
                    onPressed: _loggedInButtonPressed,
                    child: const Text("Sign in")),
              ),
            if (errorMessage != null) Text(errorMessage)
          ],
        ),
      ),
    );
  }
}

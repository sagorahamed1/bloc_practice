import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the LoginScreen Widget
class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (_) => LoginBloc(),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }

              if (state is LoginSuccess) {
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Username TextField
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username'),
                ),
                // Password TextField
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(height: 20),

                // BlocBuilder to build button UI based on the current state
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    // Check if the username and password are not empty
                    bool isButtonEnabled = _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;

                    // Show loading indicator when in LoginLoading state
                    if (state is LoginLoading) {
                      return CircularProgressIndicator();
                    }

                    return ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        context.read<LoginBloc>().add(LoginButtonPressed(
                          username: username,
                          password: password,
                        ));
                      }
                          : null, // Disable button if fields are empty
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonEnabled ? Colors.green : Colors.grey, // Change button color based on enabled state
                      ),
                      child: Text("Login"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Define the Login BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      // Simulate a network call
      await Future.delayed(const Duration(seconds: 2));

      if (event.username == "user" && event.password == "password") {
        yield LoginSuccess();
      } else {
        yield LoginFailure(errorMessage: "Invalid credentials");
      }
    }
  }
}

// Define the Login States
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure({required this.errorMessage});
}

// Define the Login Events
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  LoginButtonPressed({required this.username, required this.password});
}

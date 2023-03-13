import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordControlle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Login Screen")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<LoginProvider>(builder: ((context, value, child) {
              return TextFormField(
                obscureText: value.obsecure,
                controller: passwordControlle,
                decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          value.obsecure != value.obsecure;
                        },
                        icon: Icon(value.obsecure
                            ? Icons.visibility_off
                            : Icons.visibility))),
              );
            })),
            const SizedBox(
              height: 20,
            ),
            Consumer<LoginProvider>(builder: (context, value, child) {
              return ElevatedButton(
                  onPressed: () {
                    value.login(emailController.text.toString(),
                        passwordControlle.text.toString());
                  },
                  child: value.loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text("Login"));
            })
          ],
        ),
      ),
    );
  }
}

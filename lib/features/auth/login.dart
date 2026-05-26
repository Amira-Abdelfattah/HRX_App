import 'package:flutter/material.dart';

import '../widgets/hrx_gradient_bg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HrxGradientBackground(
        child: Center(
          child: Text(
            'Login Screen',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

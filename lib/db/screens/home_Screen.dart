import 'package:flutter/material.dart';
import 'package:hive_login/db/models/data_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome $email'),
      ),
    );
  }
}
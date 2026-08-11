import 'package:flutter/material.dart';

class CompleteSignUpScreen extends StatefulWidget {
  final String phoneNumber;
  final String ticket;
  const CompleteSignUpScreen({
    super.key,
    required this.phoneNumber,
    required this.ticket,
  });

  @override
  State<CompleteSignUpScreen> createState() => _CompleteSignUpScreenState();
}

class _CompleteSignUpScreenState extends State<CompleteSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

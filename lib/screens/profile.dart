import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_pro/provider/setup_data.dart';

class ProfileUser extends StatefulWidget {
  const ProfileUser({super.key});

  @override
  State<ProfileUser> createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('hola'),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/setting');
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Hero(
            tag: 'profile_1',
            child: CircleAvatar(
              radius: 150,
              foregroundImage: AssetImage('assets/images/raiden_shogun.png'),
            ),
          ),
        ),
      ),
    );
  }
}

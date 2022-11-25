import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late File file;
  bool isSelected = false;
  Future getPath() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file = File(result.files.single.path!);
      
    } else {
      // User canceled the picker
      return;
    }
  }

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
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: 'profile_1',
              child: CircleAvatar(
                radius: 150,
                foregroundImage: isSelected
                    ? FileImage(file)
                    : const AssetImage('assets/images/raiden_shogun.png'),
              ),
            ),
            TextButton(
              onPressed: () async {
                getPath();

                setState(() {
                  isSelected = true;
                });
              },
              child: const Text('Change Porfile'),
            ),
          ],
        ),
      ),
    );
  }
}

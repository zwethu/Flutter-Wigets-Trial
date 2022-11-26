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
      setState(() {
        file = File(result.files.single.path!);
      });
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isSelected
                    ? Hero(
                        tag: 'profile_1',
                        child: CircleAvatar(
                          radius: 150,
                          foregroundImage: FileImage(file),
                        ),
                      )
                    : const Hero(
                        tag: 'profile_1',
                        child: CircleAvatar(
                          radius: 150,
                          foregroundImage:
                              AssetImage('assets/images/raiden_shogun.png'),
                        ),
                      ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      await getPath();
                      setState(() {
                        isSelected = true;
                      });
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(
                          150,
                          50,
                        ),
                      ),
                      maximumSize: MaterialStateProperty.all(
                        Size(
                          MediaQuery.of(context).size.width,
                          50,
                        ),
                      ),
                    ),
                    child: const Text('Change Profile'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

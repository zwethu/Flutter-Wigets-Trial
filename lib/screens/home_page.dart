import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:widgets_testing/screens/drawer_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void getPath() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

if (result != null) {
  File file = File(result.files.single.path!);
  print(file.path);
} else {
  // User canceled the picker
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, '/profile');
              }),
              child: const Hero(
                tag: 'profile_1',
                child: CircleAvatar(
                  foregroundImage:
                      AssetImage('assets/images/raiden_shogun.png'),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: DrawerScreen(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: controller,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('save'),
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              getPath();
            },
            icon: const Icon(Icons.access_alarm),
          ),
        ],
      ),
    );
  }

  // Future openDialogBox() {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => Hero(
  //       tag: 'profile',
  //       child: Dialog(
  //         backgroundColor: Colors.transparent,
  //         child: Container(
  //           decoration: const BoxDecoration(
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(25),
  //             ),
  //           ),
  //           width: MediaQuery.of(context).size.width * 0.8,
  //           height: 400,
  //           child: Image.asset('images/makino.jpg',fit: BoxFit.fill,),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

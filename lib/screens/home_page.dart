import 'dart:io';
import 'dart:math' as math;
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:widgets_testing/screens/drawer_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();
  late Animation<double> animation;
  late AnimationController animController;
  bool isEmpty = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {});
    animController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 0,
      end: math.pi * 1.1,
    ).chain(CurveTween(curve: Curves.ease)).animate(animController)
      ..addListener(() {
        // Empty setState because the updated value is already in the animation field
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
          isEmpty = !isEmpty;
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
          isEmpty = !isEmpty;
        }
      });
    animController.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
      body: Transform.rotate(
        angle: animation.value,
        child: Center(
          child: isEmpty
              ? Icon(Icons.hourglass_top_rounded)
              : Icon(
                  Icons.hourglass_bottom_rounded,
                ),
        ),
      ),
    );
  }

  void getPath() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }
}

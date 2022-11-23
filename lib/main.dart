import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_testing/animations/animations.dart';
import 'package:widgets_testing/basic_widgets/basic_widgets.dart';
import 'package:widgets_testing/material_widgets/material_widgets.dart';
import 'package:widgets_testing/l10n/l10n.dart';
import 'package:widgets_testing/models/provider/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:widgets_testing/screens/screens.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      builder: (context, child) {
        final provider = Provider.of<LanguageProvider>(context, listen: true);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const Home(),
          routes: {
            //
            //screens
            '/setting': (context) => const SettingScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/basic_widgets': (context) => const BasicWidgetsScreen(),
            '/material_widgets': (context) => const MaterialWidgetsScreen(),
            '/cupertino_widgets': (context) => const CupertinoWidgetsScreen(),
            '/animations': (context) => const AnimationsScreen(),
            //
            //basic widgets
            '/background_image': (context) => const BackgroundImageTest(),
            '/gridview': (context) => const GridviewBuilderTest(),
            '/listview': (context) => const ListviewTest(),
            //
            //material widgets
            '/checkbox': (context) => const CheckBoxTest(),
            '/circular_progress_indicator': (context) => const CircularBar(),
            '/dropdown_button': (context) => const DropdownBox(),
            '/radio_button': (context) => const RadioButtonTest(),
            '/refresh_button': (context) => const RefreshButtonTest(),
            '/slider': (context) => const SliderTest(),
            '/switch': (context) => const SwitchTest(),
            //
            //animations
            '/sand_clock_animation': (context) => const SandClockAnimation(),
          },
          locale: provider.locale,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

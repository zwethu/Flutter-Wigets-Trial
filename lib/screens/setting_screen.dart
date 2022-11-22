import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:widgets_testing/models/provider/language_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  
  bool isMyanmar = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.language),
            trailing: SizedBox(
              width: 180,
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)!.english),
                  Switch(
                    value: isMyanmar,
                    onChanged: (value) {
                      setState(() {
                        isMyanmar = value;
                      });
                        final provider = Provider.of<LanguageProvider>(context, listen: false);
                       
                      if (isMyanmar) {
                        provider.setMyanmar();
                      } else if (isMyanmar == false) {
                        provider.setEnglish();
                      }
                    },
                  ),
                  Text(AppLocalizations.of(context)!.myanmar),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

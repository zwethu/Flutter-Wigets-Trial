import 'package:flutter/widgets.dart';
import 'package:widgets_testing/l10n/l10n.dart';


class LanguageProvider extends ChangeNotifier{
  Locale? _locale;

  Locale get locale => _locale??const Locale('en');

  void setLocale(Locale loacle){
    if(!L10n.all.contains(locale))return;

    _locale = locale;
    notifyListeners();
  }
  void setMyanmar(){
    _locale = const Locale('my');
    notifyListeners();
  }
  void setEnglish(){
    _locale = const Locale('en');
    notifyListeners();
  }
}
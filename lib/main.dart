import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pioneerspay/Cubit/AuthorizationCubit/AuthCubit.dart';
import 'package:pioneerspay/Cubit/HomeCubit/HomeCubit.dart';
import 'package:pioneerspay/Cubit/ReportsCubit/ReportsCubit.dart';
import 'package:pioneerspay/Cubit/ServicesCubit/ServicesCubit.dart';
import 'package:pioneerspay/Ui/Screens/Authoriation/Login.dart';
import 'package:pioneerspay/Ui/Screens/Authoriation/Splash.dart';
import 'package:pioneerspay/Ui/Screens/Home/Home.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/SellersCubit/sellers_cubit.dart';
import 'Cubit/SettingsCubit/setting_cubit.dart';
import 'Provider/ProviderAccount.dart';

import 'Utils/Colors/GeneralColor.dart';
import 'Utils/Common.dart';
import 'Utils/Language/translation.dart';
import 'Utils/MyHttpOverrides.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String language = _prefs.getString(Common.LANGUAGE) ?? 'ar';
  bool login = _prefs.getBool(Common.isLogin) ?? false;

  return runApp(MyApp(
    defaultLanguage: language,
    isLogin: login,
  ));
}

class MyApp extends StatelessWidget {
  final String defaultLanguage;
  final bool isLogin;

  const MyApp({
    required this.defaultLanguage,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    AppModel.defaultLanguage = defaultLanguage;

    return ScopedModel<AppModel>(
      model: AppModel(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ), BlocProvider(
            create: (context) => HomeCubit(),
          ),  BlocProvider(
            create: (context) => ServicesCubit(),
          ), BlocProvider(
            create: (context) => ReportsCubit(),
          ),BlocProvider(
            create: (context) => SettingCubit(),
          ), BlocProvider(
            create: (context) => SellersCubit(),
          ),
        ],
        child: OverlaySupport(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider.value(
                value: ProviderAccount(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: RestartWidget(
                const Scaffold(),
                isLogin,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppModel extends Model {
  static String? defaultLanguage;

  Locale _appLocale = Locale(defaultLanguage!);

  Locale get appLocal => _appLocale;

  Future changeDirection(String lang) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    _appLocale = Locale(lang);

    _prefs.setString('language', lang);
    notifyListeners();
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget(this.child, this.iLogin);

  final Widget child;
  final bool iLogin;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState(iLogin);
}

class _RestartWidgetState extends State<RestartWidget> {
  final bool isLogin;

  _RestartWidgetState(this.isLogin);

  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: build2(context),
    );
  }

  Widget build2(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return KeyedSubtree(
      key: key,
      child: ScopedModelDescendant<AppModel>(
          builder: (context, child, model) => MaterialApp(
              locale: model.appLocal,
              theme: ThemeData(
                fontFamily: 'Cairo',
                useMaterial3: false,
                primaryColor: GeneralColor.appColor,
                // accentColor: GeneralColor.appColor,
                splashColor: GeneralColor.appColor,
                inputDecorationTheme: const InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              localizationsDelegates: const [
                TranslationsDelegate(),
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar', ''), // Arabic
                Locale('en', ''), // English
              ],
              debugShowCheckedModeBanner: false,
              title: "شكرا باي",
              home: Splash(isLogin),
              routes: routes)),
    );
  }

  var routes = <String, WidgetBuilder>{
    // "/home": (BuildContext context) => MainScreen(),
    // "/intro": (BuildContext context) => IntroScreen(),
  };
}

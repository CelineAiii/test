import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'test',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'HomePage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'shopping': ShoppingWidget(),
      'sport': SportWidget(),
      'social': SocialWidget(),
      'diet_plan': DietPlanWidget(),
      'user': UserWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF3C2E92),
        unselectedItemColor: Color(0x00000000),
        selectedBackgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        borderRadius: 8.0,
        itemBorderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        width: double.infinity,
        elevation: 10.0,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_rounded,
                  color:
                      currentIndex == 0 ? Color(0xFF3C2E92) : Color(0x00000000),
                  size: 24.0,
                ),
                Text(
                  '首頁',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 0
                        ? Color(0xFF3C2E92)
                        : Color(0x00000000),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart,
                  color:
                      currentIndex == 1 ? Color(0xFF3C2E92) : Color(0x00000000),
                  size: 24.0,
                ),
                Text(
                  '購物',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 1
                        ? Color(0xFF3C2E92)
                        : Color(0x00000000),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.sports_handball,
                  color:
                      currentIndex == 2 ? Color(0xFF3C2E92) : Color(0x00000000),
                  size: 24.0,
                ),
                Text(
                  '運動',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 2
                        ? Color(0xFF3C2E92)
                        : Color(0x00000000),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.people,
                  color:
                      currentIndex == 3 ? Color(0xFF3C2E92) : Color(0x00000000),
                  size: 24.0,
                ),
                Text(
                  '社群',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 3
                        ? Color(0xFF3C2E92)
                        : Color(0x00000000),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.assignment_outlined,
                  color:
                      currentIndex == 4 ? Color(0xFF3C2E92) : Color(0x00000000),
                  size: 24.0,
                ),
                Text(
                  '減肥',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 4
                        ? Color(0xFF3C2E92)
                        : Color(0x00000000),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.solidUserCircle,
                  color:
                      currentIndex == 5 ? Color(0xFF3C2E92) : Color(0x00000000),
                  size: 24.0,
                ),
                Text(
                  'user',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 5
                        ? Color(0xFF3C2E92)
                        : Color(0x00000000),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

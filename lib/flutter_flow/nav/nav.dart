import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => NavBarPage(),
          routes: [
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomePage')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'shopping',
              path: 'shopping',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'shopping')
                  : ShoppingWidget(),
            ),
            FFRoute(
              name: 'sport',
              path: 'sport',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'sport')
                  : SportWidget(
                      date: params.getParam('date', ParamType.DateTime),
                    ),
            ),
            FFRoute(
              name: 'analyze',
              path: 'analyze',
              builder: (context, params) => AnalyzeWidget(),
            ),
            FFRoute(
              name: 'social',
              path: 'social',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'social')
                  : SocialWidget(),
            ),
            FFRoute(
              name: 'diet_plan',
              path: 'dietPlan',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'diet_plan')
                  : DietPlanWidget(),
            ),
            FFRoute(
              name: 'sign_in',
              path: 'signIn',
              builder: (context, params) => SignInWidget(
                password: params.getParam('password', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'user',
              path: 'user',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'user')
                  : UserWidget(),
            ),
            FFRoute(
              name: 'forget_password',
              path: 'forgetPassword',
              builder: (context, params) => ForgetPasswordWidget(),
            ),
            FFRoute(
              name: 'timer',
              path: 'timer',
              builder: (context, params) => TimerWidget(
                time: params.getParam('time', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'food',
              path: 'food',
              builder: (context, params) => FoodWidget(
                searchName: params.getParam<String>(
                    'searchName', ParamType.String, true),
              ),
            ),
            FFRoute(
              name: 'record',
              path: 'record',
              builder: (context, params) => RecordWidget(),
            ),
            FFRoute(
              name: 'view_food',
              path: 'viewFood',
              builder: (context, params) => ViewFoodWidget(),
            ),
            FFRoute(
              name: 'nutrient',
              path: 'nutrient',
              builder: (context, params) => NutrientWidget(),
            ),
            FFRoute(
              name: 'target_setting1',
              path: 'targetSetting1',
              builder: (context, params) => TargetSetting1Widget(),
            ),
            FFRoute(
              name: 'food_recommand',
              path: 'foodRecommand',
              builder: (context, params) => FoodRecommandWidget(),
            ),
            FFRoute(
              name: 'target_setting2',
              path: 'targetSetting2',
              builder: (context, params) => TargetSetting2Widget(),
            ),
            FFRoute(
              name: 'target_setting3',
              path: 'targetSetting3',
              builder: (context, params) => TargetSetting3Widget(),
            ),
            FFRoute(
              name: 'setting',
              path: 'setting',
              builder: (context, params) => SettingWidget(),
            ),
            FFRoute(
              name: 'user_setting',
              path: 'userSetting',
              builder: (context, params) => UserSettingWidget(),
            ),
            FFRoute(
              name: 'classify_food',
              path: 'classifyFood',
              builder: (context, params) => ClassifyFoodWidget(),
            ),
            FFRoute(
              name: 'select_analyze',
              path: 'selectAnalyze',
              builder: (context, params) => SelectAnalyzeWidget(),
            ),
            FFRoute(
              name: 'nutrient_record',
              path: 'nutrientRecord',
              builder: (context, params) => NutrientRecordWidget(),
            ),
            FFRoute(
              name: 'weight_analyze',
              path: 'weightAnalyze',
              builder: (context, params) => WeightAnalyzeWidget(
                weight:
                    params.getParam<String>('weight', ParamType.String, true),
              ),
            ),
            FFRoute(
              name: 'sport_record',
              path: 'sportRecord',
              builder: (context, params) => SportRecordWidget(),
            ),
            FFRoute(
              name: 'sport_ball',
              path: 'sportBall',
              builder: (context, params) => SportBallWidget(),
            ),
            FFRoute(
              name: 'sport_swim',
              path: 'sportSwim',
              builder: (context, params) => SportSwimWidget(),
            ),
            FFRoute(
              name: 'sport_run',
              path: 'sportRun',
              builder: (context, params) => SportRunWidget(),
            ),
            FFRoute(
              name: 'sport_yoga',
              path: 'sportYoga',
              builder: (context, params) => SportYogaWidget(),
            ),
            FFRoute(
              name: 'product',
              path: 'product',
              builder: (context, params) => ProductWidget(),
            ),
            FFRoute(
              name: 'record_water',
              path: 'recordWater',
              builder: (context, params) => RecordWaterWidget(),
            ),
            FFRoute(
              name: 'view_food2',
              path: 'viewFood2',
              builder: (context, params) => ViewFood2Widget(),
            ),
            FFRoute(
              name: 'view_food3',
              path: 'viewFood3',
              builder: (context, params) => ViewFood3Widget(),
            ),
            FFRoute(
              name: 'view_food4',
              path: 'viewFood4',
              builder: (context, params) => ViewFood4Widget(),
            ),
            FFRoute(
              name: 'water_target',
              path: 'waterTarget',
              builder: (context, params) => WaterTargetWidget(),
            ),
            FFRoute(
              name: 'view_sport',
              path: 'viewSport',
              builder: (context, params) => ViewSportWidget(),
            ),
            FFRoute(
              name: 'food_weekend',
              path: 'foodWeekend',
              builder: (context, params) => FoodWeekendWidget(
                date: params.getParam('date', ParamType.DateTime),
              ),
            ),
            FFRoute(
              name: 'sport_bike',
              path: 'sportBike',
              builder: (context, params) => SportBikeWidget(),
            ),
            FFRoute(
              name: 'sport_other',
              path: 'sportOther',
              builder: (context, params) => SportOtherWidget(),
            ),
            FFRoute(
              name: 'sport_costumize',
              path: 'sportCostumize',
              builder: (context, params) => SportCostumizeWidget(),
            ),
            FFRoute(
              name: 'food_costumize',
              path: 'foodCostumize',
              builder: (context, params) => FoodCostumizeWidget(
                name: params.getParam('name', ParamType.bool),
              ),
            ),
            FFRoute(
              name: 'searchPage',
              path: 'searchPage',
              builder: (context, params) => SearchPageWidget(
                searchName: params.getParam<String>(
                    'searchName', ParamType.String, true),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

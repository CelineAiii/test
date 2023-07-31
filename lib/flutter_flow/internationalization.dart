import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['zh_Hant', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? zh_HantText = '',
    String? enText = '',
  }) =>
      [zh_HantText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'gcdiuq2n': {
      'zh_Hant': 'Celine Ai',
      'en': '',
    },
    '3o28kfsy': {
      'zh_Hant': 'LV.9999',
      'en': '',
    },
    'wcx7ycnx': {
      'zh_Hant': '50%',
      'en': '',
    },
    'jpvnkctl': {
      'zh_Hant': '100000',
      'en': '',
    },
    'wktty6un': {
      'zh_Hant': '卡路里攝取量',
      'en': '',
    },
    'pn8us8zs': {
      'zh_Hant': '50%',
      'en': '',
    },
    '3jxu5uem': {
      'zh_Hant': '水分攝取量',
      'en': '',
    },
    'b12sryvc': {
      'zh_Hant': '50%',
      'en': '',
    },
    'iio8tnsq': {
      'zh_Hant': '早餐',
      'en': '',
    },
    '9vchkvps': {
      'zh_Hant': '共230大卡',
      'en': '',
    },
    'fgsj9ko6': {
      'zh_Hant': '午餐',
      'en': '',
    },
    '0mtzdntr': {
      'zh_Hant': '共580大卡',
      'en': '',
    },
    'f1mya4nc': {
      'zh_Hant': '晚餐',
      'en': '',
    },
    'kj6hpc68': {
      'zh_Hant': '共500大卡',
      'en': '',
    },
    'm0nyd31b': {
      'zh_Hant': '點心',
      'en': '',
    },
    'bzjwjtuf': {
      'zh_Hant': '共480大卡',
      'en': '',
    },
    '4ppo8br8': {
      'zh_Hant': '今日攝取卡路里數',
      'en': '',
    },
    'bjto2kb0': {
      'zh_Hant': '共1790卡',
      'en': '',
    },
    '6qjc3mxb': {
      'zh_Hant': '55%',
      'en': '',
    },
    'bx04cltl': {
      'zh_Hant': '總攝取量佔比',
      'en': '',
    },
    '2i23id2v': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'q3hy2eqy': {
      'zh_Hant': '首頁',
      'en': '',
    },
  },
  // shopping
  {
    'ytn74fe9': {
      'zh_Hant': ' Products',
      'en': '',
    },
    'm9qm5een': {
      'zh_Hant': '已擁有之商品',
      'en': '',
    },
    'yhpy4pe4': {
      'zh_Hant': '漂亮的糖果罐',
      'en': '',
    },
    'uaclfso6': {
      'zh_Hant': 'Produced by Celine',
      'en': '',
    },
    '84m9q16i': {
      'zh_Hant': '30 Pt',
      'en': '',
    },
    'i2w1gobt': {
      'zh_Hant': '可愛的糖果罐',
      'en': '',
    },
    'pr1l544p': {
      'zh_Hant': 'Produced by Celine',
      'en': '',
    },
    '1wknsxmp': {
      'zh_Hant': '28 Pt',
      'en': '',
    },
    't2bzv6i7': {
      'zh_Hant': '拐杖糖',
      'en': '',
    },
    'gje3g2ea': {
      'zh_Hant': 'Produced by Celine',
      'en': '',
    },
    '8jzd5qte': {
      'zh_Hant': '50 Pt',
      'en': '',
    },
    'ju22v1xt': {
      'zh_Hant': '好看的糖果',
      'en': '',
    },
    'fpe36z03': {
      'zh_Hant': 'Produced by Celine',
      'en': '',
    },
    'holg8j7q': {
      'zh_Hant': '50 Pt',
      'en': '',
    },
    's22vhl0f': {
      'zh_Hant': '普通好看的糖果罐',
      'en': '',
    },
    'yin0x08w': {
      'zh_Hant': 'Produced by Celine',
      'en': '',
    },
    '5e7uj8u1': {
      'zh_Hant': '20 Pt',
      'en': '',
    },
    'kkfrap0l': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    '4nnr1m4s': {
      'zh_Hant': '購物',
      'en': '',
    },
  },
  // sport
  {
    'higqiuj1': {
      'zh_Hant': 'This is your daily summary.',
      'en': '',
    },
    'g4i6o3tg': {
      'zh_Hant': '今日運動時間',
      'en': '',
    },
    'bi75mcfp': {
      'zh_Hant': 'Goals',
      'en': '',
    },
    'bjgrgh1y': {
      'zh_Hant': '2hr',
      'en': '',
    },
    'ms94vcfk': {
      'zh_Hant': '已消耗卡路里',
      'en': '',
    },
    'bfbcdp32': {
      'zh_Hant': '大卡',
      'en': '',
    },
    '46w1yt9m': {
      'zh_Hant': '200',
      'en': '',
    },
    'qxa1j1m4': {
      'zh_Hant': '今日剩餘',
      'en': '',
    },
    'ixh7bjqm': {
      'zh_Hant': '100',
      'en': '',
    },
    'uy5ox0o3': {
      'zh_Hant': 'Timer',
      'en': '',
    },
    'uad7is6x': {
      'zh_Hant': 'Go Training Now',
      'en': '',
    },
    'cptijfdl': {
      'zh_Hant': 'Record',
      'en': '',
    },
    'x5cee2bc': {
      'zh_Hant': 'Go Record Your Training Now',
      'en': '',
    },
    'crx94f5r': {
      'zh_Hant': 'Hi! Celine',
      'en': '',
    },
    'rdadx54s': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // analyze
  {
    'hswzjhmp': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'djmb8y00': {
      'zh_Hant': 'Daily Report',
      'en': '',
    },
    '5mmtinlt': {
      'zh_Hant': '今日運動量完成率％',
      'en': '',
    },
    'dc0ph5gu': {
      'zh_Hant': '目標時數：100 hr',
      'en': '',
    },
    '3eyklna1': {
      'zh_Hant': '完成時數：50 hr',
      'en': '',
    },
    '232n68u0': {
      'zh_Hant': '50%',
      'en': '',
    },
    'kul1mz1g': {
      'zh_Hant': '今日卡路里攝取率％',
      'en': '',
    },
    'ce3axdje': {
      'zh_Hant': '目標卡路里數：1200 kal',
      'en': '',
    },
    'zaea4mzd': {
      'zh_Hant': '今日攝取：1000 kal',
      'en': '',
    },
    'e73albrz': {
      'zh_Hant': '83.3%',
      'en': '',
    },
    '58n8g2xb': {
      'zh_Hant': '今日三大營養素攝取率％',
      'en': '',
    },
    '4toiwqcz': {
      'zh_Hant': '蛋白質建議量：80 g',
      'en': '',
    },
    'a0fo2ua8': {
      'zh_Hant': '今日攝取：40 g',
      'en': '',
    },
    '7qpms948': {
      'zh_Hant': '79%',
      'en': '',
    },
    'ktvzm7ku': {
      'zh_Hant': '脂質建議量：20 g',
      'en': '',
    },
    'p4iqwfju': {
      'zh_Hant': '今日攝取：10 g',
      'en': '',
    },
    '5fyenfwc': {
      'zh_Hant': '50%',
      'en': '',
    },
    'g2os0c7w': {
      'zh_Hant': '碳水建議量：50 g',
      'en': '',
    },
    'v3rf4zqg': {
      'zh_Hant': '今日攝取：30 g',
      'en': '',
    },
    'n24zbw8o': {
      'zh_Hant': '60%',
      'en': '',
    },
    'xlm3wsm2': {
      'zh_Hant': '今日整體完成度',
      'en': '',
    },
    'u1a2r6a5': {
      'zh_Hant': '截圖',
      'en': '',
    },
    '9hlxo0tu': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // social
  {
    'j8kiywyb': {
      'zh_Hant': 'Welcome',
      'en': '',
    },
    'i0nxczll': {
      'zh_Hant': 'Hello World',
      'en': '',
    },
    'ncu5zni4': {
      'zh_Hant': 'Checkout news and highlights below.',
      'en': '',
    },
    'zyet7ro2': {
      'zh_Hant': '@username',
      'en': '',
    },
    'rrjqjqdg': {
      'zh_Hant': '2,493',
      'en': '',
    },
    'dg63mnjx': {
      'zh_Hant': '4',
      'en': '',
    },
    'stq16z8s': {
      'zh_Hant':
          'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
      'en': '',
    },
    'cm8hq85k': {
      'zh_Hant': '@username',
      'en': '',
    },
    'g5x75n6f': {
      'zh_Hant': '2,493',
      'en': '',
    },
    'oj09nnfn': {
      'zh_Hant': '4',
      'en': '',
    },
    'r2dauf7n': {
      'zh_Hant':
          'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
      'en': '',
    },
    '492fzvlh': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'rnzoh3i5': {
      'zh_Hant': '社群',
      'en': '',
    },
  },
  // diet_plan
  {
    'yxgepgzb': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    '7yniin3c': {
      'zh_Hant': '目前的減肥計劃為：',
      'en': '',
    },
    '7o3prw4t': {
      'zh_Hant': '168間歇性斷食法',
      'en': '',
    },
    'om5tp76x': {
      'zh_Hant': '請在此選擇您的減肥計劃',
      'en': '',
    },
    'in0fzu59': {
      'zh_Hant': '168間歇性斷食法',
      'en': '',
    },
    'c2wtgb70': {
      'zh_Hant': '1. 實行方式：',
      'en': '',
    },
    'fycnpbry': {
      'zh_Hant': '進食時間：8小時\n斷食時間：16小時',
      'en': '',
    },
    'n1h4u0yf': {
      'zh_Hant': '2. 注意事項：',
      'en': '',
    },
    '5tgguyee': {
      'zh_Hant': '斷食前最後一餐吃飽一點\n進食8 小時內避免油炸物、高熱量食物、零食甜點、精緻碳水化合物等',
      'en': '',
    },
    'jf88k3tk': {
      'zh_Hant': '確定',
      'en': '',
    },
    '2rehxgl7': {
      'zh_Hant': '168間歇性斷食法',
      'en': '',
    },
    'elk8xgg4': {
      'zh_Hant': '1. 實行方式：',
      'en': '',
    },
    '1rdm6qtp': {
      'zh_Hant': '進食時間：8小時\n斷食時間：16小時',
      'en': '',
    },
    'xjp79qfk': {
      'zh_Hant': '2. 注意事項：',
      'en': '',
    },
    'x339hoev': {
      'zh_Hant': '斷食前最後一餐吃飽一點\n進食8 小時內避免油炸物、高熱量食物、零食甜點、精緻碳水化合物等',
      'en': '',
    },
    'v1nkfrst': {
      'zh_Hant': '確定',
      'en': '',
    },
    'ngfrunq3': {
      'zh_Hant': '168間歇性斷食法',
      'en': '',
    },
    'd9ng62p6': {
      'zh_Hant': '1. 實行方式：',
      'en': '',
    },
    'lqot5eoi': {
      'zh_Hant': '進食時間：8小時\n斷食時間：16小時',
      'en': '',
    },
    'ffbhy532': {
      'zh_Hant': '2. 注意事項：',
      'en': '',
    },
    'gb0t78u1': {
      'zh_Hant': '斷食前最後一餐吃飽一點\n進食8 小時內避免油炸物、高熱量食物、零食甜點、精緻碳水化合物等',
      'en': '',
    },
    'n9pygquh': {
      'zh_Hant': '確定',
      'en': '',
    },
    'whdvq8zy': {
      'zh_Hant': '推薦食譜',
      'en': '',
    },
    'rih2ze2y': {
      'zh_Hant': '1. 早餐:',
      'en': '',
    },
    'm77asa7y': {
      'zh_Hant': '希臘優格+燕麥\n香蕉*1',
      'en': '',
    },
    'orisnn1l': {
      'zh_Hant': '1. 早餐:',
      'en': '',
    },
    'hcsot12k': {
      'zh_Hant': '希臘優格+燕麥\n香蕉*1',
      'en': '',
    },
    'vbpuzd4g': {
      'zh_Hant': '1. 早餐:',
      'en': '',
    },
    '4sxj2j7b': {
      'zh_Hant': '希臘優格+燕麥\n香蕉*1',
      'en': '',
    },
    'wqz6m2pq': {
      'zh_Hant': '推薦食譜',
      'en': '',
    },
    '578xdliw': {
      'zh_Hant': '1. 早餐:',
      'en': '',
    },
    'qeukmx0m': {
      'zh_Hant': '希臘優格+燕麥\n香蕉*1',
      'en': '',
    },
    '6niobmfm': {
      'zh_Hant': '推薦食譜',
      'en': '',
    },
    'o3ibui37': {
      'zh_Hant': '1. 早餐:',
      'en': '',
    },
    '5awjio86': {
      'zh_Hant': '希臘優格+燕麥\n香蕉*1',
      'en': '',
    },
    '0cluujcd': {
      'zh_Hant': '減肥',
      'en': '',
    },
  },
  // sign_in
  {
    '69j8r5jo': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    's4wxv4lx': {
      'zh_Hant': 'Sign In',
      'en': '',
    },
    'xyd37vh8': {
      'zh_Hant': 'Enter your email...',
      'en': '',
    },
    'elimdt0x': {
      'zh_Hant': 'Enter your password...',
      'en': '',
    },
    'xf5mspge': {
      'zh_Hant': 'Sign In',
      'en': '',
    },
    'sz3yi0lm': {
      'zh_Hant': 'Forgot Password?',
      'en': '',
    },
    '937kpc4c': {
      'zh_Hant': 'Sign Up',
      'en': '',
    },
    'rlt88wwa': {
      'zh_Hant': 'Enter your email...',
      'en': '',
    },
    '9c1wao67': {
      'zh_Hant': 'Enter your password...',
      'en': '',
    },
    'ki9xb0gs': {
      'zh_Hant': 'Create Account',
      'en': '',
    },
    'mnuajpbp': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // user
  {
    '35ik1loa': {
      'zh_Hant': 'Celine Ai',
      'en': '',
    },
    '5bkv560c': {
      'zh_Hant': 'LV.999 | \$100000',
      'en': '',
    },
    'j3vvki8a': {
      'zh_Hant': '修改個人資料',
      'en': '',
    },
    'pusgek6x': {
      'zh_Hant': '目前減肥計劃',
      'en': '',
    },
    '54j4vvmt': {
      'zh_Hant': '168斷食法',
      'en': '',
    },
    'yyphs6vw': {
      'zh_Hant': '- 預計花費 150 日即可達成 -',
      'en': '',
    },
    'vomy4mih': {
      'zh_Hant': '每日可攝取總量：',
      'en': '',
    },
    'z58fccpp': {
      'zh_Hant': '1200 kal',
      'en': '',
    },
    '84yhfc16': {
      'zh_Hant': '建議食譜',
      'en': '',
    },
    '7kwkyyac': {
      'zh_Hant': '今日飲食攝取量',
      'en': '',
    },
    'hlh45g3d': {
      'zh_Hant': '攝取卡路里數：1000 kal',
      'en': '',
    },
    'eyrerky5': {
      'zh_Hant': '每日總攝取限制：1500 kal',
      'en': '',
    },
    'wz3s5o9b': {
      'zh_Hant': '今日運動消耗',
      'en': '',
    },
    'fp8txb5v': {
      'zh_Hant': '消耗卡路里數：1000 kal',
      'en': '',
    },
    'b5alq9wr': {
      'zh_Hant': '運動總時數：4 hr',
      'en': '',
    },
    'knyv0g86': {
      'zh_Hant': 'Created by Candy Diary',
      'en': '',
    },
    'muylm87r': {
      'zh_Hant': '登出',
      'en': '',
    },
    '59d2zy2g': {
      'zh_Hant': 'user',
      'en': '',
    },
  },
  // forget_password
  {
    'agkw1k18': {
      'zh_Hant': 'Back',
      'en': '',
    },
    'xchqoiwb': {
      'zh_Hant': 'Forgot Password',
      'en': '',
    },
    'dhbyeupg': {
      'zh_Hant':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'en': '',
    },
    'kvvpt1dy': {
      'zh_Hant': 'Your email address...',
      'en': '',
    },
    'h1v7p80y': {
      'zh_Hant': 'Enter your email...',
      'en': '',
    },
    'affywxro': {
      'zh_Hant': 'Send Link',
      'en': '',
    },
    'e2pg8vbl': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // food
  {
    'v2hbd5xf': {
      'zh_Hant': 'Search products...',
      'en': '',
    },
    '9t7lo2gq': {
      'zh_Hant': 'Carbohydrate',
      'en': '',
    },
    'fnuj697m': {
      'zh_Hant': 'Protein',
      'en': '',
    },
    '9rozguco': {
      'zh_Hant': 'Fat',
      'en': '',
    },
    'dgbp0dmb': {
      'zh_Hant': 'Water',
      'en': '',
    },
    'mwecd7z6': {
      'zh_Hant': 'Categories',
      'en': '',
    },
    'xxdo5vla': {
      'zh_Hant': 'See All',
      'en': '',
    },
    '527jn22z': {
      'zh_Hant': 'Steak',
      'en': '',
    },
    'ip8g8e35': {
      'zh_Hant': 'Category Name',
      'en': '',
    },
    'w56d6bp3': {
      'zh_Hant': 'Salad',
      'en': '',
    },
    'gduks77e': {
      'zh_Hant': 'Category Name',
      'en': '',
    },
    'qji14274': {
      'zh_Hant': 'Cake',
      'en': '',
    },
    'i2y0bu9r': {
      'zh_Hant': 'Category Name',
      'en': '',
    },
    'w7l76xok': {
      'zh_Hant': 'Western Cuisine',
      'en': '',
    },
    'uouw1t82': {
      'zh_Hant': 'Category Name',
      'en': '',
    },
    'v0wquucg': {
      'zh_Hant': 'Spaghetti',
      'en': '',
    },
    'c0h5l338': {
      'zh_Hant': 'Category Name',
      'en': '',
    },
    '3va8b5ge': {
      'zh_Hant': 'Others',
      'en': '',
    },
    '45voi4xi': {
      'zh_Hant': 'Category Name',
      'en': '',
    },
    '1th6m5yh': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // timer
  {
    'zrjji4wj': {
      'zh_Hant': 'Time Left',
      'en': '',
    },
    'zo2wtj5r': {
      'zh_Hant': '修改時間',
      'en': '',
    },
    'a3g64sa5': {
      'zh_Hant': 'Workout ',
      'en': '',
    },
    't1qsc1d0': {
      'zh_Hant': 'Push Ups',
      'en': '',
    },
    'n6gzgvz8': {
      'zh_Hant': 'Current Set',
      'en': '',
    },
    '4vdew5vn': {
      'zh_Hant': '40 in 1 minute',
      'en': '',
    },
    '6f3fyzu7': {
      'zh_Hant':
          'Pushups are an exercise in which a person, keeping a prone position, with the hands palms down under the shoulders, the balls of the feet on the ground, and the back straight, pushes the body up and lets it down by an alternate straightening and bending of the arms.',
      'en': '',
    },
    '1rioi8an': {
      'zh_Hant': 'Complete Workout',
      'en': '',
    },
    'dlxnrtnh': {
      'zh_Hant': 'Pushups',
      'en': '',
    },
    '6cequxul': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // record
  {
    'jkr1u9dh': {
      'zh_Hant': 'Daily Lessons',
      'en': '',
    },
    '6m7kt223': {
      'zh_Hant': '查看本週紀錄',
      'en': '',
    },
    'nigq3gxz': {
      'zh_Hant': '早餐',
      'en': '',
    },
    'luhcr8gw': {
      'zh_Hant': 'A wonderfully delicious 2 patty melt that melts into your...',
      'en': '',
    },
    'qlhqnf7s': {
      'zh_Hant': '午餐',
      'en': '',
    },
    'vn0e8kv0': {
      'zh_Hant': '晚餐',
      'en': '',
    },
    'cnmbo1y9': {
      'zh_Hant': '點心',
      'en': '',
    },
    'klpvcf9r': {
      'zh_Hant': 'Learn how to brew a delicious pourover every morning.',
      'en': '',
    },
    'lkmu1xsl': {
      'zh_Hant': '請在此紀錄您的飲水量',
      'en': '',
    },
    '15pgzods': {
      'zh_Hant': '記錄飲水',
      'en': '',
    },
    '9kjf72nn': {
      'zh_Hant': '修改飲水目標',
      'en': '',
    },
    '78lf2fcu': {
      'zh_Hant': '- 目前飲水目標：2000 ml -',
      'en': '',
    },
    'k32bkhy6': {
      'zh_Hant': 'Hi! Celine',
      'en': '',
    },
    '5utn8l6l': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // view_food
  {
    'm8uf8g3s': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    'z07tdr95': {
      'zh_Hant': '起司漢堡',
      'en': '',
    },
    'f2d7mmv6': {
      'zh_Hant': '500大卡',
      'en': '',
    },
    'ij131rts': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    '8x1tq4qr': {
      'zh_Hant': '豆漿',
      'en': '',
    },
    '02c1bf21': {
      'zh_Hant': '180大卡',
      'en': '',
    },
    'qmv3whvd': {
      'zh_Hant': '早餐',
      'en': '',
    },
    '41uz41ce': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // nutrient
  {
    'cr8vmvt4': {
      'zh_Hant': 'Name',
      'en': '',
    },
    'aipqdzmb': {
      'zh_Hant': '起司漢堡',
      'en': '',
    },
    'vj6dzh90': {
      'zh_Hant': 'Calories',
      'en': '',
    },
    '1iw9mosv': {
      'zh_Hant': '230',
      'en': '',
    },
    'ixpdpw2y': {
      'zh_Hant': 'Total Carbs',
      'en': '',
    },
    'lal31lt8': {
      'zh_Hant': '32g',
      'en': '',
    },
    'ttywdyr0': {
      'zh_Hant': 'Fiber',
      'en': '',
    },
    'hs58lnsx': {
      'zh_Hant': '4g',
      'en': '',
    },
    '47vs88tu': {
      'zh_Hant': 'Sugars',
      'en': '',
    },
    'smj1tjwg': {
      'zh_Hant': '1g',
      'en': '',
    },
    'q8fazf7w': {
      'zh_Hant': 'Total Fat',
      'en': '',
    },
    '2w99n9h2': {
      'zh_Hant': '8g',
      'en': '',
    },
    'kghegq8j': {
      'zh_Hant': 'Saturated Fat',
      'en': '',
    },
    'bons6m4n': {
      'zh_Hant': '1g',
      'en': '',
    },
    'aogmzw21': {
      'zh_Hant': 'Trans Fat',
      'en': '',
    },
    '0j4ib9wh': {
      'zh_Hant': '0g',
      'en': '',
    },
    'ibx0is0n': {
      'zh_Hant': 'Protein',
      'en': '',
    },
    '7ekmi3jl': {
      'zh_Hant': '3g',
      'en': '',
    },
    'p0rur26f': {
      'zh_Hant': 'Sodium',
      'en': '',
    },
    'u6v7elq6': {
      'zh_Hant': '2mg',
      'en': '',
    },
    'uyb5ftjb': {
      'zh_Hant': '每100克',
      'en': '',
    },
    '5fsp6rs2': {
      'zh_Hant': '每一份量',
      'en': '',
    },
    '7wqmelhk': {
      'zh_Hant': 'unit',
      'en': '',
    },
    '6ijb6gr8': {
      'zh_Hant': '份/克',
      'en': '',
    },
    '2ftqrfz8': {
      'zh_Hant': 'Add',
      'en': '',
    },
    '39bypz3e': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'lgmx675n': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // food_recommand
  {
    '2rtg499i': {
      'zh_Hant': '- 推薦食譜 -',
      'en': '',
    },
    '1nygul98': {
      'zh_Hant': '以下為今日推薦您的食譜',
      'en': '',
    },
    'tpq9dwlb': {
      'zh_Hant': '1. 早餐：',
      'en': '',
    },
    'v6wy9xwt': {
      'zh_Hant': 'Hello World',
      'en': '',
    },
    'zbblx6kc': {
      'zh_Hant': 'Hello World',
      'en': '',
    },
    '1r5k8eku': {
      'zh_Hant': 'Hello World',
      'en': '',
    },
    'ej69lgmz': {
      'zh_Hant': '2. 午餐：',
      'en': '',
    },
    'clm1s0eo': {
      'zh_Hant': 'Hello World',
      'en': '',
    },
    'm95ga6r3': {
      'zh_Hant': 'Hello World',
      'en': '',
    },
    'c9h8oi58': {
      'zh_Hant': 'Hello World',
      'en': '',
    },
    'e03qwnc6': {
      'zh_Hant': '3. 晚餐：',
      'en': '',
    },
    'gzamu213': {
      'zh_Hant': '4. 點心：',
      'en': '',
    },
    'ory97fdp': {
      'zh_Hant': ' ',
      'en': '',
    },
    '3na4ztc7': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    '2htbm4tn': {
      'zh_Hant': '減肥',
      'en': '',
    },
  },
  // target_setting1
  {
    'mttmdugs': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'o5wyky0m': {
      'zh_Hant': '- 目標設定 -',
      'en': '',
    },
    'b6v33zi9': {
      'zh_Hant': '1. 身高：',
      'en': '',
    },
    'hbsw72ey': {
      'zh_Hant': 'ex. 158',
      'en': '',
    },
    'rigngj8h': {
      'zh_Hant': '2. 現在體重：',
      'en': '',
    },
    '8smtamdb': {
      'zh_Hant': 'ex. 158',
      'en': '',
    },
    'ywdypywe': {
      'zh_Hant': '3. 目標體重：',
      'en': '',
    },
    'mk2jzg5i': {
      'zh_Hant': 'ex. 158',
      'en': '',
    },
    'monnib9r': {
      'zh_Hant': '確定',
      'en': '',
    },
    'qeta4mzp': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // target_setting2
  {
    'd7htg3mo': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'xy79jbct': {
      'zh_Hant': '- 目標設定 -',
      'en': '',
    },
    '8sixivwu': {
      'zh_Hant': '請挑選您的活動程度：',
      'en': '',
    },
    'r7qhu13g': {
      'zh_Hant': '低活動量',
      'en': '',
    },
    '6wnkvwdc': {
      'zh_Hant': '一天一小時',
      'en': '',
    },
    'cthlbrge': {
      'zh_Hant': '一周小於兩天',
      'en': '',
    },
    'oszro8e6': {
      'zh_Hant': '中活動量',
      'en': '',
    },
    'tbpvkixn': {
      'zh_Hant': '一天二小時',
      'en': '',
    },
    'jfe4s89j': {
      'zh_Hant': '一周2~3天 ',
      'en': '',
    },
    'ehyham37': {
      'zh_Hant': '高活動量',
      'en': '',
    },
    'ojc5b4rx': {
      'zh_Hant': '一天二小時',
      'en': '',
    },
    'deks0thf': {
      'zh_Hant': '一周大於三天',
      'en': '',
    },
    'l1xj5h1o': {
      'zh_Hant': '確定',
      'en': '',
    },
    '6ji7yn2q': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // target_setting3
  {
    'x4nxrkjv': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    '3415knl2': {
      'zh_Hant': '- 目標設定 -',
      'en': '',
    },
    'qa0qq1z7': {
      'zh_Hant': '是否有個人疾病史：',
      'en': '',
    },
    'qrh0m7us': {
      'zh_Hant': '糖尿病',
      'en': '',
    },
    '3acpji1c': {
      'zh_Hant': '乳糖不耐症',
      'en': '',
    },
    'nifag18k': {
      'zh_Hant': '無',
      'en': '',
    },
    'ko1t2l6h': {
      'zh_Hant': '無',
      'en': '',
    },
    'klkn174r': {
      'zh_Hant': '確定',
      'en': '',
    },
    'fvyox5fk': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // setting
  {
    '7ey8hja6': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'cq7zmb7h': {
      'zh_Hant': '- 修改資料 -',
      'en': '',
    },
    'cze0a44z': {
      'zh_Hant': '請挑選您欲修改的項目：',
      'en': '',
    },
    'phyk4byu': {
      'zh_Hant': '個人資料',
      'en': '',
    },
    's5giea5f': {
      'zh_Hant': '目標設定',
      'en': '',
    },
    '6x70p2we': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // user_setting
  {
    'ewz1qf60': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    '7ikl2xvk': {
      'zh_Hant': '- 個人資料設定 -',
      'en': '',
    },
    '7g4sred2': {
      'zh_Hant': '1. 暱稱：',
      'en': '',
    },
    '1ux5p2ev': {
      'zh_Hant': 'ex. Celine',
      'en': '',
    },
    'l5f8ajd4': {
      'zh_Hant': '2. 性別：',
      'en': '',
    },
    '6yxq4s0y': {
      'zh_Hant': 'Female',
      'en': '',
    },
    'or1rv02n': {
      'zh_Hant': 'Female',
      'en': '',
    },
    'z5oxqqhf': {
      'zh_Hant': 'Male',
      'en': '',
    },
    '1i29lx89': {
      'zh_Hant': '3. 身高：',
      'en': '',
    },
    '6ua90556': {
      'zh_Hant': 'ex. 158',
      'en': '',
    },
    'omcrov8v': {
      'zh_Hant': '4. 體重：',
      'en': '',
    },
    'n0parimi': {
      'zh_Hant': 'ex. 50',
      'en': '',
    },
    '2ugjija4': {
      'zh_Hant': '5. 年齡：',
      'en': '',
    },
    '438fjci8': {
      'zh_Hant': 'ex. 20',
      'en': '',
    },
    'cmv9fzkm': {
      'zh_Hant': '確定',
      'en': '',
    },
    'k2hy295u': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // classify_food
  {
    'u51z3han': {
      'zh_Hant': 'Cancel',
      'en': '',
    },
    'u7uinrr6': {
      'zh_Hant': 'Search products...',
      'en': '',
    },
    'azkxhz10': {
      'zh_Hant': 'Carbohydrate',
      'en': '',
    },
    'y1vkhf9g': {
      'zh_Hant': 'Protein',
      'en': '',
    },
    'q6fjjp0j': {
      'zh_Hant': 'Fat',
      'en': '',
    },
    'k1s6vtqa': {
      'zh_Hant': 'Water',
      'en': '',
    },
    'myjfigif': {
      'zh_Hant': 'Salad',
      'en': '',
    },
    'wcsclv9c': {
      'zh_Hant': 'See All',
      'en': '',
    },
    'cl2a1y1y': {
      'zh_Hant': '燻鮭魚沙拉',
      'en': '',
    },
    'v8yltyu2': {
      'zh_Hant': '230大卡',
      'en': '',
    },
    'ifc2vzho': {
      'zh_Hant': '鮪魚沙拉',
      'en': '',
    },
    'mnifl3ix': {
      'zh_Hant': '580大卡',
      'en': '',
    },
    'fa9nsig7': {
      'zh_Hant': '凱薩沙拉',
      'en': '',
    },
    '5ns3k6fm': {
      'zh_Hant': '500大卡',
      'en': '',
    },
    '8d6qa1tx': {
      'zh_Hant': '和風沙拉',
      'en': '',
    },
    'mi3x3a5g': {
      'zh_Hant': '480大卡',
      'en': '',
    },
    'q9z6obcw': {
      'zh_Hant': '千島醬沙拉',
      'en': '',
    },
    '8963fi29': {
      'zh_Hant': '480大卡',
      'en': '',
    },
    '6gnn0szm': {
      'zh_Hant': '龍蝦沙拉',
      'en': '',
    },
    '9pvxfw3n': {
      'zh_Hant': '480大卡',
      'en': '',
    },
    'f8waoeqn': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // select_analyze
  {
    'o0wfyg2t': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'jniqvf0g': {
      'zh_Hant': '- 結算報告 -',
      'en': '',
    },
    'r3uocg4m': {
      'zh_Hant': '挑選您想了解的結算報告：',
      'en': '',
    },
    'dc18p5cf': {
      'zh_Hant': '整日結算報告',
      'en': '',
    },
    'mtjubudo': {
      'zh_Hant': '體重變化報告',
      'en': '',
    },
    '0v7k1ffw': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // nutrient_record
  {
    'wp6eno9w': {
      'zh_Hant': 'Name',
      'en': '',
    },
    'a1nijz0y': {
      'zh_Hant': '起司漢堡',
      'en': '',
    },
    't1pp4se3': {
      'zh_Hant': 'Calories',
      'en': '',
    },
    '1sv7adcu': {
      'zh_Hant': '230',
      'en': '',
    },
    'ggi6mjwz': {
      'zh_Hant': 'Total Carbs',
      'en': '',
    },
    'p5llj0qn': {
      'zh_Hant': '32g',
      'en': '',
    },
    '4hndrz1o': {
      'zh_Hant': 'Fiber',
      'en': '',
    },
    'ghsc1bue': {
      'zh_Hant': '4g',
      'en': '',
    },
    '2a81dnll': {
      'zh_Hant': 'Sugars',
      'en': '',
    },
    '67kht3a7': {
      'zh_Hant': '1g',
      'en': '',
    },
    '9yhwa1re': {
      'zh_Hant': 'Total Fat',
      'en': '',
    },
    'tdn8fhdy': {
      'zh_Hant': '8g',
      'en': '',
    },
    '3ltahha5': {
      'zh_Hant': 'Saturated Fat',
      'en': '',
    },
    'kwcu8o2z': {
      'zh_Hant': '1g',
      'en': '',
    },
    'm5w2yjy4': {
      'zh_Hant': 'Trans Fat',
      'en': '',
    },
    'ghewe6q3': {
      'zh_Hant': '0g',
      'en': '',
    },
    'asjq9j89': {
      'zh_Hant': 'Protein',
      'en': '',
    },
    'hmv41am0': {
      'zh_Hant': '3g',
      'en': '',
    },
    '696kwhx0': {
      'zh_Hant': 'Sodium',
      'en': '',
    },
    '2ks6yyx8': {
      'zh_Hant': '2mg',
      'en': '',
    },
    '8hxirmol': {
      'zh_Hant': '1',
      'en': '',
    },
    'uznhm7qb': {
      'zh_Hant': '份',
      'en': '',
    },
    'j9qjdlqw': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'jgh43ctp': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // weight_analyze
  {
    '6wt1ia9f': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'a53118mq': {
      'zh_Hant': 'Weight Report',
      'en': '',
    },
    'fmynfjzo': {
      'zh_Hant': '- 今日體重紀錄 -',
      'en': '',
    },
    'fk2spb9e': {
      'zh_Hant': '昨日體重：52 kg',
      'en': '',
    },
    's8zyjcms': {
      'zh_Hant': '30',
      'en': '',
    },
    'txe5tro8': {
      'zh_Hant': 'Please select...',
      'en': '',
    },
    '502r7h6q': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    '5luxbvlp': {
      'zh_Hant': '確認',
      'en': '',
    },
    '3c15j3fv': {
      'zh_Hant': '- 體重分析圖 -',
      'en': '',
    },
    'gv3zadmv': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // sport_record
  {
    'gx76ghxj': {
      'zh_Hant': 'Hi! Celine',
      'en': '',
    },
    'y48atww8': {
      'zh_Hant': '點擊查看今日運動紀錄',
      'en': '',
    },
    '38uuw5qt': {
      'zh_Hant': '球類運動',
      'en': '',
    },
    'djokt4vz': {
      'zh_Hant': '記錄關於球類運動的部分...',
      'en': '',
    },
    'pdqzd4fp': {
      'zh_Hant': '跑步/走路',
      'en': '',
    },
    '3ncn3hkq': {
      'zh_Hant': '記錄關於行走相關運動的部分...',
      'en': '',
    },
    '75f99jdz': {
      'zh_Hant': '游泳',
      'en': '',
    },
    'nwy09fha': {
      'zh_Hant': '記錄關於游泳運動的部分...',
      'en': '',
    },
    '5quqhwgo': {
      'zh_Hant': '腳踏車',
      'en': '',
    },
    'm1y3n8wl': {
      'zh_Hant': '記錄關於腳踏車相關運動的部分...',
      'en': '',
    },
    '358wz4ww': {
      'zh_Hant': '有氧相關運動',
      'en': '',
    },
    '6sk9khf0': {
      'zh_Hant': '記錄關於有氧運動的部分...',
      'en': '',
    },
    'qj3i1wrp': {
      'zh_Hant': '其他運動',
      'en': '',
    },
    'f4zdnd5t': {
      'zh_Hant': '記錄關於其他運動（核心）的部分...',
      'en': '',
    },
    'wos0do7g': {
      'zh_Hant': '自定義運動',
      'en': '',
    },
    'yal1bl6p': {
      'zh_Hant': '記錄關於自定義運動的部分...',
      'en': '',
    },
    'sgsdwf27': {
      'zh_Hant': '目前總運動時數：',
      'en': '',
    },
    'unb6tnjy': {
      'zh_Hant': '300 min',
      'en': '',
    },
    '37p1s8gm': {
      'zh_Hant': '目前總運動距離：',
      'en': '',
    },
    'pnj3yo5u': {
      'zh_Hant': '1000 m',
      'en': '',
    },
    'n1plvluw': {
      'zh_Hant': '目前總消耗卡路里數：',
      'en': '',
    },
    '4767wwwe': {
      'zh_Hant': '800 kal',
      'en': '',
    },
    'yahwyxw5': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // sport_ball
  {
    'rnd9eto7': {
      'zh_Hant': 'Hi! Celine',
      'en': '',
    },
    'gwm0t48e': {
      'zh_Hant': '請在此紀錄您的運動',
      'en': '',
    },
    'dzyyhgo7': {
      'zh_Hant': '保齡球',
      'en': '',
    },
    'kim1f2bc': {
      'zh_Hant': '排球',
      'en': '',
    },
    'l62f1e63': {
      'zh_Hant': '保齡球',
      'en': '',
    },
    'semhj20a': {
      'zh_Hant': '乒乓球',
      'en': '',
    },
    '66253ex4': {
      'zh_Hant': '棒壘球',
      'en': '',
    },
    'rn1frho6': {
      'zh_Hant': '高爾夫球',
      'en': '',
    },
    'o5tmlvvp': {
      'zh_Hant': '羽毛球',
      'en': '',
    },
    '5ktlbba3': {
      'zh_Hant': '籃球（半場）',
      'en': '',
    },
    'bufbcy4e': {
      'zh_Hant': '籃球（全場）',
      'en': '',
    },
    'e1dy2ubj': {
      'zh_Hant': '網球',
      'en': '',
    },
    'kem22gyr': {
      'zh_Hant': '足球',
      'en': '',
    },
    'dym9qphf': {
      'zh_Hant': '請選擇球類...',
      'en': '',
    },
    'd08wydhj': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    'tvb30n33': {
      'zh_Hant': '此次選擇之球類運動為：',
      'en': '',
    },
    'tqcqpalv': {
      'zh_Hant': '籃球',
      'en': '',
    },
    '6w33noj5': {
      'zh_Hant': '請輸入運動總時數...(單位：分鐘）',
      'en': '',
    },
    'vbc0qq6q': {
      'zh_Hant': '此次輸入之總時數為：',
      'en': '',
    },
    '17cnrxl6': {
      'zh_Hant': '30 min',
      'en': '',
    },
    'yq3zcmb4': {
      'zh_Hant': 'Total:',
      'en': '',
    },
    'y555o5ir': {
      'zh_Hant': '本次運動之平均熱量消耗量：',
      'en': '',
    },
    '2r75zksv': {
      'zh_Hant': '400 kal',
      'en': '',
    },
    'tq2fechb': {
      'zh_Hant': '加入運動',
      'en': '',
    },
    '1bx4t43x': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // sport_swim
  {
    '4msnrga4': {
      'zh_Hant': 'Hi! Celine',
      'en': '',
    },
    'rof0ogrb': {
      'zh_Hant': '請在此紀錄您的運動',
      'en': '',
    },
    '4ugxtzgm': {
      'zh_Hant': '游泳（慢）',
      'en': '',
    },
    '9azb1slb': {
      'zh_Hant': '游泳（較快）',
      'en': '',
    },
    'rrdgy282': {
      'zh_Hant': '請選擇運動種類...',
      'en': '',
    },
    '8htwiruu': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    'gyctz3w3': {
      'zh_Hant': '此次選擇之運動為：',
      'en': '',
    },
    '2sx0iqs0': {
      'zh_Hant': '游泳',
      'en': '',
    },
    'himevmyu': {
      'zh_Hant': '請輸入運動總距離...(單位：公尺）',
      'en': '',
    },
    '07fk3k5a': {
      'zh_Hant': '此次輸入之總距離為：',
      'en': '',
    },
    'nh170y28': {
      'zh_Hant': '800 公尺',
      'en': '',
    },
    'e3wbyxs7': {
      'zh_Hant': 'Total:',
      'en': '',
    },
    'v83vuima': {
      'zh_Hant': '本次運動之平均熱量消耗量：',
      'en': '',
    },
    'bimm7tti': {
      'zh_Hant': '400 kal',
      'en': '',
    },
    'tuzfegof': {
      'zh_Hant': '加入運動',
      'en': '',
    },
    'fyowzrhn': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // sport_run
  {
    'ggx9tor0': {
      'zh_Hant': 'Hi! Celine',
      'en': '',
    },
    '1kz9dhi2': {
      'zh_Hant': '請在此紀錄您的運動',
      'en': '',
    },
    '4lx0g5k1': {
      'zh_Hant': '快走、健走',
      'en': '',
    },
    'tuejgb2e': {
      'zh_Hant': '慢走',
      'en': '',
    },
    'sabtyree': {
      'zh_Hant': '下樓梯',
      'en': '',
    },
    'j4fxf2e2': {
      'zh_Hant': '上樓梯',
      'en': '',
    },
    'vewv526x': {
      'zh_Hant': '慢跑',
      'en': '',
    },
    '35cd8i7o': {
      'zh_Hant': '普通快跑',
      'en': '',
    },
    'v5npttjs': {
      'zh_Hant': '加強快跑',
      'en': '',
    },
    'nhb6seig': {
      'zh_Hant': '請選擇運動種類...',
      'en': '',
    },
    'alatla5u': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    't0m3p88t': {
      'zh_Hant': '此次選擇之運動為：',
      'en': '',
    },
    'yx0ctu68': {
      'zh_Hant': '跑步',
      'en': '',
    },
    'k3dv0bbc': {
      'zh_Hant': '請輸入運動總時數...(單位：分鐘）',
      'en': '',
    },
    'mle7b05x': {
      'zh_Hant': '此次輸入之總時數為：',
      'en': '',
    },
    '227inz8f': {
      'zh_Hant': '30 min',
      'en': '',
    },
    'oc2lzefw': {
      'zh_Hant': 'Total:',
      'en': '',
    },
    '4boklsyi': {
      'zh_Hant': '本次運動之平均熱量消耗量：',
      'en': '',
    },
    'gg3wkfpl': {
      'zh_Hant': '400 kal',
      'en': '',
    },
    '0vw4k54d': {
      'zh_Hant': '加入運動',
      'en': '',
    },
    'knux5noo': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // sport_yoga
  {
    'qkowovpo': {
      'zh_Hant': 'Hi! Celine',
      'en': '',
    },
    'rsr6jswq': {
      'zh_Hant': '請在此紀錄您的運動',
      'en': '',
    },
    'bb4es15k': {
      'zh_Hant': '瑜珈',
      'en': '',
    },
    'rgbocrpg': {
      'zh_Hant': '跳舞（慢）',
      'en': '',
    },
    '0vrpd42c': {
      'zh_Hant': '跳舞（快）',
      'en': '',
    },
    'bok7jlzs': {
      'zh_Hant': '太極拳',
      'en': '',
    },
    '83odsuzy': {
      'zh_Hant': '有氧舞蹈',
      'en': '',
    },
    '6e5maxsc': {
      'zh_Hant': '請選擇運動種類...',
      'en': '',
    },
    'o2janrpy': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    'nrlscdbd': {
      'zh_Hant': '此次選擇之運動為：',
      'en': '',
    },
    'g60e50lf': {
      'zh_Hant': '瑜珈',
      'en': '',
    },
    'f5zcgzsg': {
      'zh_Hant': '請輸入運動總時間...(單位：分鐘）',
      'en': '',
    },
    'vd8nhss7': {
      'zh_Hant': '此次輸入之總時間為：',
      'en': '',
    },
    'drsdd2hn': {
      'zh_Hant': '30 min',
      'en': '',
    },
    'ea57e5dj': {
      'zh_Hant': 'Total:',
      'en': '',
    },
    'cgvf0qxa': {
      'zh_Hant': '本次運動之平均熱量消耗量：',
      'en': '',
    },
    'mpl04q3h': {
      'zh_Hant': '400 kal',
      'en': '',
    },
    '2hvsqy8l': {
      'zh_Hant': '加入運動',
      'en': '',
    },
    '2wcj2jwf': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // product
  {
    'tooiobju': {
      'zh_Hant': '已擁有之商品：',
      'en': '',
    },
    'ez4b3rbu': {
      'zh_Hant': '預設糖果罐',
      'en': '',
    },
    'eu3051n2': {
      'zh_Hant': 'Produced by Celine',
      'en': '',
    },
    'z2vcbl2q': {
      'zh_Hant': '替換',
      'en': '',
    },
    'q8ppii2c': {
      'zh_Hant': '預設糖果',
      'en': '',
    },
    'xk6dys2o': {
      'zh_Hant': 'Produced by Celine',
      'en': '',
    },
    'yb4b4lku': {
      'zh_Hant': '替換',
      'en': '',
    },
    'l5rcqs1m': {
      'zh_Hant': '普通好看的糖果罐',
      'en': '',
    },
    'uy491o4y': {
      'zh_Hant': 'Produced by Celine',
      'en': '',
    },
    'jt3yy0sb': {
      'zh_Hant': '替換',
      'en': '',
    },
    'e91plmqk': {
      'zh_Hant': '雷根糖',
      'en': '',
    },
    '2yez3wr9': {
      'zh_Hant': 'Produced by Celine',
      'en': '',
    },
    'za8xsbm6': {
      'zh_Hant': '替換',
      'en': '',
    },
    '0o6hydn1': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'sizhcyw0': {
      'zh_Hant': '購物',
      'en': '',
    },
  },
  // record_water
  {
    'nz7cv0y3': {
      'zh_Hant': 'Name',
      'en': '',
    },
    'd5s9bleq': {
      'zh_Hant': '飲水量',
      'en': '',
    },
    '51sqopy8': {
      'zh_Hant': '請在此輸入要記錄的飲水量',
      'en': '',
    },
    'pmhe4w0r': {
      'zh_Hant': 'ex. 100、450',
      'en': '',
    },
    'zzomoq1m': {
      'zh_Hant': 'ml',
      'en': '',
    },
    'su34n946': {
      'zh_Hant': 'Add',
      'en': '',
    },
    'opz6uv3s': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    '9034ddbv': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // view_food2
  {
    '27aigvqi': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    'x29i8zsc': {
      'zh_Hant': '起司漢堡',
      'en': '',
    },
    'huo1g28s': {
      'zh_Hant': '500大卡',
      'en': '',
    },
    '2v89drej': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    'ibzuq7ko': {
      'zh_Hant': '豆漿',
      'en': '',
    },
    'joj747i3': {
      'zh_Hant': '180大卡',
      'en': '',
    },
    '7jhq8z1s': {
      'zh_Hant': '午餐',
      'en': '',
    },
    '55godxqr': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // view_food3
  {
    'qenbiw55': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    '6qm136h7': {
      'zh_Hant': '起司漢堡',
      'en': '',
    },
    'yer1a5my': {
      'zh_Hant': '500大卡',
      'en': '',
    },
    'ob8ag5dd': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    'iwlbsk26': {
      'zh_Hant': '豆漿',
      'en': '',
    },
    '8apyojei': {
      'zh_Hant': '180大卡',
      'en': '',
    },
    '903wmqx9': {
      'zh_Hant': '晚餐',
      'en': '',
    },
    'aj9wvupi': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // view_food4
  {
    '2z85pqln': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    'h8xzua07': {
      'zh_Hant': '起司漢堡',
      'en': '',
    },
    'o6hvvuws': {
      'zh_Hant': '500大卡',
      'en': '',
    },
    'sq6izw4v': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    'x0d51258': {
      'zh_Hant': '豆漿',
      'en': '',
    },
    '4f0ecee0': {
      'zh_Hant': '180大卡',
      'en': '',
    },
    'fsduh6wp': {
      'zh_Hant': '點心',
      'en': '',
    },
    'ealv8pxa': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // water_target
  {
    '4h4z7uno': {
      'zh_Hant': 'Name',
      'en': '',
    },
    '6uifvq0v': {
      'zh_Hant': '飲水量目標',
      'en': '',
    },
    'wbnvepa0': {
      'zh_Hant': '請在此輸入欲修改的飲水量目標',
      'en': '',
    },
    'g7qdq292': {
      'zh_Hant': 'ex. 2000、1500',
      'en': '',
    },
    'qa6cyn6o': {
      'zh_Hant': 'ml',
      'en': '',
    },
    'ghdfy7ln': {
      'zh_Hant': 'Add',
      'en': '',
    },
    'jafcv0rz': {
      'zh_Hant': 'Candy Diary',
      'en': '',
    },
    'w783mqs8': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // view_sport
  {
    'xi19f98g': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    'se2oj67b': {
      'zh_Hant': 'Edit',
      'en': '',
    },
    'u0kidq14': {
      'zh_Hant': '游泳 - 800公尺',
      'en': '',
    },
    '8t4sk7gn': {
      'zh_Hant': '消耗 300 kal',
      'en': '',
    },
    'dhp0h0f1': {
      'zh_Hant': 'Delete',
      'en': '',
    },
    'b115yy8s': {
      'zh_Hant': 'Edit',
      'en': '',
    },
    'zwgltacm': {
      'zh_Hant': '慢跑 - 30 min',
      'en': '',
    },
    'fbn76m40': {
      'zh_Hant': '消耗 180 kal',
      'en': '',
    },
    '6lze4zeq': {
      'zh_Hant': '今日運動紀錄',
      'en': '',
    },
    'f0wpubxg': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // food_weekend
  {
    'qoyweu4c': {
      'zh_Hant': 'Page Title',
      'en': '',
    },
    'ryt31ums': {
      'zh_Hant': '早餐',
      'en': '',
    },
    'z4i7smlm': {
      'zh_Hant': '共230大卡',
      'en': '',
    },
    '3yf1g9g2': {
      'zh_Hant': '早餐',
      'en': '',
    },
    '7tn9goye': {
      'zh_Hant': '午餐',
      'en': '',
    },
    'wxi1v3qb': {
      'zh_Hant': '共580大卡',
      'en': '',
    },
    '7scmu7oy': {
      'zh_Hant': '晚餐',
      'en': '',
    },
    'l8p2ibjd': {
      'zh_Hant': '共500大卡',
      'en': '',
    },
    '1l38tgvn': {
      'zh_Hant': '點心',
      'en': '',
    },
    '3wz0icku': {
      'zh_Hant': '共480大卡',
      'en': '',
    },
    'kkwmdh7c': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // sport_bike
  {
    '5ukq3x24': {
      'zh_Hant': 'Hi! Celine',
      'en': '',
    },
    '0uz4029u': {
      'zh_Hant': '請在此紀錄您的運動',
      'en': '',
    },
    'bfd3u0mv': {
      'zh_Hant': '一般速度 10km/hr',
      'en': '',
    },
    'ozl288g6': {
      'zh_Hant': '偏快 20km/hr',
      'en': '',
    },
    'z3efqnoo': {
      'zh_Hant': '快速30km/hr',
      'en': '',
    },
    'f6eghyp5': {
      'zh_Hant': '請選擇運動種類...',
      'en': '',
    },
    'xt7zvcec': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    'sapg6yff': {
      'zh_Hant': '此次選擇之運動為：',
      'en': '',
    },
    'sab14hpg': {
      'zh_Hant': '跑步',
      'en': '',
    },
    'inuysxcn': {
      'zh_Hant': '請輸入運動總時數...(單位：分鐘）',
      'en': '',
    },
    '9wthwnco': {
      'zh_Hant': '此次輸入之總時數為：',
      'en': '',
    },
    'tyr6g725': {
      'zh_Hant': '30 min',
      'en': '',
    },
    'vj8eftoh': {
      'zh_Hant': 'Total:',
      'en': '',
    },
    '5hci0mxa': {
      'zh_Hant': '本次運動之平均熱量消耗量：',
      'en': '',
    },
    '4s0f31l4': {
      'zh_Hant': '400 kal',
      'en': '',
    },
    '2tv4s713': {
      'zh_Hant': '加入運動',
      'en': '',
    },
    'rmrmitpw': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // sport_other
  {
    'z4gslv69': {
      'zh_Hant': 'Hi! Celine',
      'en': '',
    },
    'sypbabxn': {
      'zh_Hant': '請在此紀錄您的運動',
      'en': '',
    },
    '90rcdnol': {
      'zh_Hant': '跳繩（慢）',
      'en': '',
    },
    't94fjdmc': {
      'zh_Hant': '跳繩（快）',
      'en': '',
    },
    'im190e50': {
      'zh_Hant': '飛盤',
      'en': '',
    },
    'd9i44nx9': {
      'zh_Hant': '直排輪',
      'en': '',
    },
    '7ewn9bag': {
      'zh_Hant': '請選擇運動種類...',
      'en': '',
    },
    '3btwvzr9': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    'purt66dk': {
      'zh_Hant': '此次選擇之運動為：',
      'en': '',
    },
    'gcj64f3y': {
      'zh_Hant': '瑜珈',
      'en': '',
    },
    'hg4osg46': {
      'zh_Hant': '請輸入運動總時間...(單位：分鐘）',
      'en': '',
    },
    'p2wlgppz': {
      'zh_Hant': '此次輸入之總時間為：',
      'en': '',
    },
    'mkwvjk64': {
      'zh_Hant': '30 min',
      'en': '',
    },
    '22kohqwc': {
      'zh_Hant': 'Total:',
      'en': '',
    },
    'of4m6iio': {
      'zh_Hant': '本次運動之平均熱量消耗量：',
      'en': '',
    },
    'xs8vyuri': {
      'zh_Hant': '400 kal',
      'en': '',
    },
    'tqka9myj': {
      'zh_Hant': '加入運動',
      'en': '',
    },
    'esat87h5': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // sport_costumize
  {
    'lmcix99p': {
      'zh_Hant': '快速加入運動',
      'en': '',
    },
    '9s2ytlob': {
      'zh_Hant': '運動名稱',
      'en': '',
    },
    '6x0btm0v': {
      'zh_Hant': '消耗卡路里',
      'en': '',
    },
    '32itnoy3': {
      'zh_Hant': '(cal)',
      'en': '',
    },
    'qq11403u': {
      'zh_Hant': '時間',
      'en': '',
    },
    'b4iqn8ut': {
      'zh_Hant': '(min)',
      'en': '',
    },
    'd8er99ph': {
      'zh_Hant': '點心',
      'en': '',
    },
    'hgrz6c7c': {
      'zh_Hant': '選擇運動日期',
      'en': '',
    },
    '9bhp7hua': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    'y3txh2ni': {
      'zh_Hant': '儲存運動',
      'en': '',
    },
    'l0uyblpq': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // food_costumize
  {
    '4xoj3ys5': {
      'zh_Hant': '快速加入食品',
      'en': '',
    },
    'wjnn8ba4': {
      'zh_Hant': '食品名稱',
      'en': '',
    },
    'wcjtue95': {
      'zh_Hant': '無',
      'en': '',
    },
    'flntlqin': {
      'zh_Hant': '卡路里',
      'en': '',
    },
    'ydog0gqb': {
      'zh_Hant': '(cal)',
      'en': '',
    },
    'i0l97nmk': {
      'zh_Hant': '0',
      'en': '',
    },
    'xf4jn58p': {
      'zh_Hant': '糖類',
      'en': '',
    },
    'b12ps8fx': {
      'zh_Hant': '(g)',
      'en': '',
    },
    '2jtfsany': {
      'zh_Hant': '0',
      'en': '',
    },
    '0mqp5krt': {
      'zh_Hant': '蛋白質',
      'en': '',
    },
    'emdg1tx2': {
      'zh_Hant': '(g)',
      'en': '',
    },
    '60g2t3d5': {
      'zh_Hant': '0',
      'en': '',
    },
    '3rosfyqr': {
      'zh_Hant': '碳水化合物',
      'en': '',
    },
    'eytsk4g5': {
      'zh_Hant': '(g)',
      'en': '',
    },
    'nb8gtusv': {
      'zh_Hant': '0',
      'en': '',
    },
    'xb3jfu46': {
      'zh_Hant': '飽和脂肪',
      'en': '',
    },
    'dgb1yt89': {
      'zh_Hant': '(g)',
      'en': '',
    },
    'mcb3s2fq': {
      'zh_Hant': '0',
      'en': '',
    },
    'iq1gfs4o': {
      'zh_Hant': '反式脂肪',
      'en': '',
    },
    'e10uutvn': {
      'zh_Hant': '(g)',
      'en': '',
    },
    '7hzuso7z': {
      'zh_Hant': '0',
      'en': '',
    },
    '0t0n45x5': {
      'zh_Hant': '早餐',
      'en': '',
    },
    'hi0eitlz': {
      'zh_Hant': '早餐',
      'en': '',
    },
    'thuxmg0v': {
      'zh_Hant': '午餐',
      'en': '',
    },
    'mbzta7df': {
      'zh_Hant': '晚餐',
      'en': '',
    },
    '5suprb3i': {
      'zh_Hant': '點心',
      'en': '',
    },
    'x0bge0mg': {
      'zh_Hant': '選擇飲食時段',
      'en': '',
    },
    'och8ujh3': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    'az7dzljn': {
      'zh_Hant': '2023-07-28',
      'en': '',
    },
    'dwpm06x1': {
      'zh_Hant': '選擇飲食日期',
      'en': '',
    },
    '0yw9ndet': {
      'zh_Hant': 'Search for an item...',
      'en': '',
    },
    'azzv3pu3': {
      'zh_Hant': '儲存食品',
      'en': '',
    },
    'fxrqu7r3': {
      'zh_Hant': 'Home',
      'en': '',
    },
  },
  // choose_detect
  {
    'sofm4rxm': {
      'zh_Hant': '選取辨識種類',
      'en': '',
    },
    'ixrclx30': {
      'zh_Hant': 'label or photo',
      'en': '',
    },
    'v71sez5s': {
      'zh_Hant': '食品影像',
      'en': '',
    },
    'ztvo2cgc': {
      'zh_Hant': '食品標籤',
      'en': '',
    },
  },
  // Miscellaneous
  {
    '9pzqymt8': {
      'zh_Hant': '',
      'en': '',
    },
    'xt2j49nd': {
      'zh_Hant': '',
      'en': '',
    },
    'e269bx8f': {
      'zh_Hant': '',
      'en': '',
    },
    'jhgq7ysw': {
      'zh_Hant': '',
      'en': '',
    },
    'c788dg1s': {
      'zh_Hant': '',
      'en': '',
    },
    'tyolnjm6': {
      'zh_Hant': '',
      'en': '',
    },
    'ilf7vmrd': {
      'zh_Hant': '',
      'en': '',
    },
    'y65lvvoc': {
      'zh_Hant': '',
      'en': '',
    },
    'zrxgx8u7': {
      'zh_Hant': '',
      'en': '',
    },
    's8nbfy0r': {
      'zh_Hant': '',
      'en': '',
    },
    '66i0qybu': {
      'zh_Hant': '',
      'en': '',
    },
    'sqcn3ck6': {
      'zh_Hant': '',
      'en': '',
    },
    '5cy8dpk2': {
      'zh_Hant': '',
      'en': '',
    },
    '08a2ymx5': {
      'zh_Hant': '',
      'en': '',
    },
    'j4cp7d7a': {
      'zh_Hant': '',
      'en': '',
    },
    'louxh1c2': {
      'zh_Hant': '',
      'en': '',
    },
    'nto91c2c': {
      'zh_Hant': '',
      'en': '',
    },
    'zpp9ehqu': {
      'zh_Hant': '',
      'en': '',
    },
    '9pmfrp1j': {
      'zh_Hant': '',
      'en': '',
    },
    '4rkasqkf': {
      'zh_Hant': '',
      'en': '',
    },
    '5pxlmnyd': {
      'zh_Hant': '',
      'en': '',
    },
    '97zsb1zp': {
      'zh_Hant': '',
      'en': '',
    },
    '5xryyq19': {
      'zh_Hant': '',
      'en': '',
    },
    't48gr2i8': {
      'zh_Hant': '',
      'en': '',
    },
    'drbp4ifu': {
      'zh_Hant': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));

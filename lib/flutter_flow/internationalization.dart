import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // userHome
  {
    'a31neq9t': {
      'en': 'چاوەڕوانی',
      'ar': 'قيد الانتظار',
    },
    'ig2wy8c8': {
      'en': 'پەسەندکراو',
      'ar': 'موافقة',
    },
    '0qk4gtsq': {
      'en': 'تەواوبوو',
      'ar': 'منتهي',
    },
    'j91fouxh': {
      'en': 'تکایە خزمەتگوزاری هەڵبژێرە',
      'ar': 'اختر خدمة الفاتورة',
    },
    'oc6hm1hy': {
      'en': 'دوایین پارەدانەکان',
      'ar': 'الناس يدفعون فواتيرهم',
    },
    '93mwxuz3': {
      'en': 'هاوکاری',
      'ar': 'يدعم',
    },
    '7cd6ouso': {
      'en': 'General',
      'ar': 'عام',
    },
    '7hk698mp': {
      'en': 'Bills Records',
      'ar': 'سجلات الفواتير',
    },
    'dqogulb4': {
      'en': 'Support',
      'ar': 'يدعم',
    },
    'd4qajp8c': {
      'en': 'Terms of Service',
      'ar': 'شروط الخدمة',
    },
    '8tgg47wa': {
      'en': 'Invite Friends',
      'ar': 'دعوة الأصدقاء',
    },
    'rgyktg5v': {
      'en': 'Log out',
      'ar': 'تسجيل الخروج',
    },
    'laomrzxk': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // welcomePage
  {
    '3mwn2451': {
      'en': 'بەخێربێی\nبۆ\nکورد بیڵس',
      'ar': 'مرحبًا بكم في الفاتورة السريعة',
    },
    'sh3h311y': {
      'en': 'ڕێگایەکی ئاسان و پارێزراو بۆ پارەدان',
      'ar': 'طريقة آمنة ومريحة لدفع فواتيرك في مكان واحد',
    },
    'jzd7n6cd': {
      'en': 'Select language',
      'ar': 'اختر اللغة',
    },
    'n66dnacy': {
      'en': 'AR',
      'ar': 'ض',
    },
    '0y0yeqpt': {
      'en': 'العربية',
      'ar': 'العربية',
    },
    'vpn6huoq': {
      'en': 'KU',
      'ar': 'أ',
    },
    'war8xet1': {
      'en': 'کوردی',
      'ar': 'إنجليزي',
    },
    'd847vqfy': {
      'en': 'get started',
      'ar': 'البدء',
    },
    '7n9kno3c': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // SignUpPage
  {
    'mcmshs5g': {
      'en': 'Login to Your Account',
      'ar': 'تسجيل الدخول إلى حسابك',
    },
    'tzenhapa': {
      'en': 'Enter your email',
      'ar': '',
    },
    'ronorikd': {
      'en': 'Enter your password',
      'ar': '',
    },
    '6tvqpzfo': {
      'en': 'Re-Enter your password',
      'ar': '',
    },
    '5k776li0': {
      'en': 'Sign up',
      'ar': 'إرسال OTP',
    },
    'eaqll9z3': {
      'en': 'Already have an account, ',
      'ar': '',
    },
    'pmgtmfbg': {
      'en': 'Login here',
      'ar': '',
    },
    'qf6ec297': {
      'en': 'OR',
      'ar': '',
    },
    '9cyjl1kh': {
      'en': 'Continue with Google',
      'ar': 'إرسال OTP',
    },
    'wvu6fs9e': {
      'en': 'Continue with Apple',
      'ar': 'إرسال OTP',
    },
    'k6to0zgi': {
      'en': 'Enter your email is required',
      'ar': '',
    },
    '7j8i2gix': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'j1z7e9pe': {
      'en': 'Enter your password is required',
      'ar': '',
    },
    '98az1iox': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'c8oo0cz5': {
      'en': 'Re-Enter your password is required',
      'ar': '',
    },
    'xeq82m9a': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'zkbxaapv': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // ProfilePage
  {
    'vjzsi7tt': {
      'en': 'Add picture',
      'ar': '',
    },
    'qix961vx': {
      'en': 'Enter your user name',
      'ar': '',
    },
    'fxzm9h7l': {
      'en': 'Your email',
      'ar': '',
    },
    '3mlsr7vj': {
      'en': '',
      'ar': '',
    },
    'f88632u0': {
      'en': '+964',
      'ar': '',
    },
    'xavrrvvo': {
      'en': 'Enter your phone number',
      'ar': '',
    },
    'cpaymxe2': {
      'en': 'هەڵگرتن',
      'ar': '',
    },
    'ux62bglm': {
      'en': 'Enter your user name is required',
      'ar': '',
    },
    'j18fq7vd': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'ufvtasvj': {
      'en': 'email is required',
      'ar': '',
    },
    'bs5npmoe': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'qcwon20z': {
      'en': 'Enter your phone number code is required',
      'ar': '',
    },
    '2yelertr': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'bw6738l7': {
      'en': 'Enter your phone number is required',
      'ar': '',
    },
    '4ewatml4': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'x9mctcdc': {
      'en': 'Set your profile',
      'ar': 'التحقق من الهاتف',
    },
    'psiqgnyc': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // LoginSuccessfully
  {
    'nleuac1p': {
      'en': 'You have successfully login',
      'ar': 'تم التحقق من رقم الهاتف',
    },
    'fnwlko3v': {
      'en': 'You will be redirected to the main page\nin a moment',
      'ar': 'سيتم تحويلك إلى الصفحة الرئيسية بعد لحظات',
    },
    'u5sr70r8': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // steps
  {
    '7anbhkvb': {
      'en': 'هەنگاوەکانی پارەدان',
      'ar': 'فاتورة الكهرباء',
    },
    'o2t90ck4': {
      'en': 'پسوولەکە بنێرە',
      'ar': 'مدينة',
    },
    'y3rofg6n': {
      'en': 'وێنەی پسولەکە بگرە',
      'ar': 'ولاية',
    },
    'ddc1fukj': {
      'en': 'چاوەڕێی ڕەزامەندی بە',
      'ar': 'مدينة',
    },
    'ocgqsraa': {
      'en': 'چاوەڕوانی ڕەزامەندی بە',
      'ar': 'ولاية',
    },
    '73kltas1': {
      'en': 'پارەکە بنێرە',
      'ar': 'مدينة',
    },
    'dcpijizx': {
      'en': 'پسولەکە و ڕسوماتەکە بدە',
      'ar': 'ولاية',
    },
    'okvvoadv': {
      'en': 'پسولەی پارەدانت وەرگرەوە',
      'ar': 'مدينة',
    },
    'yv4clhhr': {
      'en': 'کە پارەکەت درا پسولەکەت\n بۆ دەنێرینەوە لە ئاپەکە',
      'ar': 'ولاية',
    },
    '91tlmlci': {
      'en': 'پێشتر',
      'ar': 'خلف',
    },
    'gminsezk': {
      'en': 'دواتر',
      'ar': 'التالي',
    },
    '4pe5xa2r': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // takePic
  {
    '2szad1ha': {
      'en': 'تکایە دواین پسولە باربکە',
      'ar': 'انقر على أيقونة الكاميرا للنقر على صورة الفاتورة',
    },
    'u6j1m9q9': {
      'en': 'یان',
      'ar': '',
    },
    '0ctzcdsk': {
      'en': 'ئەم زانیاریانەی خوارەوە پڕ بکەوە و دواتر دابگرە',
      'ar': '',
    },
    'mls3s0ll': {
      'en': 'پێشتر',
      'ar': 'خلف',
    },
    'cgy2vkpg': {
      'en': 'دواتر',
      'ar': 'التالي',
    },
    '0dez04yr': {
      'en': 'please wait,',
      'ar': '',
    },
    'yw2cwfa2': {
      'en': ' picture is approving by admin.',
      'ar': '',
    },
    'rb833wv1': {
      'en': ' \nwe will notify you, don\'t close app from background',
      'ar': '',
    },
    '1rfa7aw4': {
      'en': 'Please check,',
      'ar': '',
    },
    'axlwffc2': {
      'en': 'picture is sent by user.',
      'ar': '',
    },
    '2c7gnytj': {
      'en': 'if it is ok then approve it',
      'ar': '',
    },
    '0zteclam': {
      'en': 'تکایە وێنەکە باربکە',
      'ar': '',
    },
    '8q2x4c8c': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // pendingAndProgress
  {
    'jdo2pemh': {
      'en': 'پسوولە',
      'ar': '',
    },
    'xquu2zk7': {
      'en': 'ژمارەی هەژماری کارەبا',
      'ar': '',
    },
    '5a19zgwh': {
      'en': 'Enter your bill number',
      'ar': '',
    },
    'vlihtix3': {
      'en': 'بەڵگەی پارەدان',
      'ar': '',
    },
    'g386p5t3': {
      'en': 'بەڵگەی پارەدانی کورد بیڵس',
      'ar': '',
    },
    'uhy6l2o5': {
      'en': 'ڕازیم',
      'ar': 'إلغائه',
    },
    'ad2cr99d': {
      'en': 'ڕەتکردنەوە',
      'ar': '',
    },
    'wrfpv9s7': {
      'en': 'پاشگەزبوونەوە',
      'ar': 'إلغائه',
    },
    '5qlf1eh6': {
      'en': 'I have paid',
      'ar': 'اذهب إلى المنزل',
    },
    'cwv36lb1': {
      'en': 'Go home',
      'ar': 'اذهب إلى المنزل',
    },
    'i6wi7c82': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // approvedBill
  {
    '2mu981en': {
      'en': 'ڕەزامەندی وەرگیرا',
      'ar': 'موافقة',
    },
    'g7dgleyi': {
      'en': 'تکایە پارەکە لە هەنگاوی دواتر بنێرە ',
      'ar':
          'بواسطة المدير.\nأرسل الأموال وسيتم دفع فاتورتك قريبًا، مع إيصال الدفع',
    },
    'q0jtkqo6': {
      'en': 'کۆی گشتی لەگەڵ تێچووی بەرنامەکە',
      'ar': '',
    },
    'f3y96bmj': {
      'en': 'Bill amount you have to pay',
      'ar': '',
    },
    '2vd0zgk4': {
      'en': 'ژمارەی پسوولە',
      'ar': '',
    },
    'az27w52g': {
      'en': 'Enter your bill number',
      'ar': '',
    },
    'p3eomfqj': {
      'en': 'Approved',
      'ar': 'موافقة',
    },
    'i1zz5p1w': {
      'en': 'ناردنی پارەکە',
      'ar': 'إرسال الأموال',
    },
    '54lvsf78': {
      'en': 'پاشگەزبوونەوە',
      'ar': 'إلغائه',
    },
    'jqd87u1p': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // sendMoney
  {
    'wxqwsg5m': {
      'en': 'فەرموو',
      'ar': 'ها هو ذا',
    },
    '2s6gip53': {
      'en': 'دەتوانی پارەکەت بەم ڕێگایانەی خوارەوە بدەی',
      'ar':
          'أرسل الأموال إلى رقم الحساب المحدد. ثم سيتم دفع فاتورتك في أسرع وقت ممكن.',
    },
    'zpdcysjh': {
      'en': 'پسوولە',
      'ar': '',
    },
    'w40m3del': {
      'en': 'تێچووی بەرنامە',
      'ar': '',
    },
    'nxovvt7n': {
      'en': 'کۆی گشتی',
      'ar': '',
    },
    'jfun58e5': {
      'en': 'ژ. ئادمین',
      'ar': '',
    },
    'n9nf85yj': {
      'en': 'Select Payment method',
      'ar': 'يختار...',
    },
    '0hc9k0z0': {
      'en': 'Search...',
      'ar': 'يبحث...',
    },
    'ares3bz9': {
      'en': 'ناردن',
      'ar': 'لقد أرسلته',
    },
    'df0yvury': {
      'en': 'please wait,',
      'ar': '',
    },
    '88vndhb9': {
      'en': 'we will notify you soon',
      'ar': '',
    },
    'xlmy3mpw': {
      'en':
          '\nyou can close app, as yur application done we will notify you with reciept',
      'ar': '',
    },
    'dhllw5zi': {
      'en': 'Please check,',
      'ar': '',
    },
    '3f88fzpp': {
      'en': 'picture is sent by user.',
      'ar': '',
    },
    'iaz92q6l': {
      'en': 'if it is ok then approve it',
      'ar': '',
    },
    'pz0rt8rw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // termsAndServices
  {
    '8eygrztt': {
      'en': 'Last Updated: May 19, 2025',
      'ar': 'آخر تحديث: ١٩ مايو ٢٠٢٥',
    },
    'nde10c16': {
      'en': 'Agree all terms and conditions',
      'ar': 'أوافق على جميع الشروط والأحكام',
    },
    'gq17exzu': {
      'en': 'Continue to home',
      'ar': 'متابعة إلى المنزل',
    },
    '2rjb8xt6': {
      'en': 'خاڵەکانی ڕەزامەندی و ڕێککەوتن',
      'ar': 'الشروط والخدمات',
    },
    '8x2shnq3': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
    },
  },
  // userBills
  {
    '7j8505hc': {
      'en': 'چاوەڕوانی',
      'ar': 'الموافقات المعلقة',
    },
    '8h9zfdnu': {
      'en': 'دوودڵ مەبە ، ڕەزامەندی وەردەگرێ لە نزیکترین کات',
      'ar': '',
    },
    '5lh1cyot': {
      'en': 'Bill ID',
      'ar': '',
    },
    'w4atj3po': {
      'en': 'please wait,',
      'ar': '',
    },
    'mbiwwgty': {
      'en': ' picture is approving by admin.',
      'ar': '',
    },
    'o141i0e3': {
      'en': ' \nwe will notify you, don\'t close app from background',
      'ar': '',
    },
    'cez7oobh': {
      'en': 'پەسەندکراو',
      'ar': 'موافقة',
    },
    'cekcfo9k': {
      'en': 'تکایە بڕی پارەکە بنێرە بۆ بەردەوامبوون',
      'ar': '',
    },
    'fe6xzrwu': {
      'en': 'Bill ID',
      'ar': '',
    },
    'ay330ml6': {
      'en': 'لە جێبەجێکردنە',
      'ar': 'مشاريع القوانين قيد التنفيذ',
    },
    'xhtfjsuz': {
      'en': 'تکایە چاوەڕوانبە ، لەزووترین کات پارەکەت بۆ دەدرێ',
      'ar': '',
    },
    'e3bi2uju': {
      'en': 'Bill ID',
      'ar': '',
    },
    'jig9dltu': {
      'en': 'please wait,',
      'ar': '',
    },
    'xrsnjda5': {
      'en': 'we will notify you soon',
      'ar': '',
    },
    'fjcovqzo': {
      'en':
          '\nyou can close app, as your application done we will notify you with reciept',
      'ar': '',
    },
    'y5hg98yc': {
      'en': 'تەواوبووە',
      'ar': 'الطلبات المكتملة',
    },
    'avw7bffh': {
      'en': 'پسوولەکەت تەواوبووە ، پارەکە دراوە',
      'ar': '',
    },
    'tk4ti1rr': {
      'en': 'Bill ID',
      'ar': '',
    },
    '2gqqgkkt': {
      'en': 'It Done,',
      'ar': '',
    },
    '0oa8hnna': {
      'en': 'you bill is paid',
      'ar': '',
    },
    '7798w6qp': {
      'en': '\nyou can close app. As its now completed.',
      'ar': '',
    },
    'vt5j5865': {
      'en': 'Support',
      'ar': 'يدعم',
    },
    'icjwfer3': {
      'en': 'List',
      'ar': 'قائمة',
    },
  },
  // support
  {
    'j0xw6s2s': {
      'en': 'Welcome to support',
      'ar': 'مرحبا بكم في الدعم',
    },
    '7q2punn9': {
      'en': 'How can we help you?',
      'ar': 'كيف يمكننا مساعدتك؟',
    },
    'oy2xbnhq': {
      'en': 'Call Us',
      'ar': 'اتصل بنا',
    },
    'as73dagc': {
      'en': 'Email Us',
      'ar': 'راسلنا عبر البريد الإلكتروني',
    },
    'k1d6pmzz': {
      'en': 'What\'sApp us',
      'ar': 'تواصل معنا عبر واتساب',
    },
    'oabuitmv': {
      'en': 'Review FAQ\'s below',
      'ar': 'راجع الأسئلة الشائعة أدناه',
    },
    'lnshvktz': {
      'en': 'How do I download Code?',
      'ar': 'كيف يمكنني تنزيل الكود؟',
    },
    'l4purycm': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'ar':
          'اعرض مجموعة من لقطات الشاشة أو النماذج الجذابة لمجموعة أدوات واجهة المستخدم الخاصة بك لجذب الانتباه وإعطاء المستخدمين لمحة عما يمكنهم توقعه.',
    },
    'hlirynv3': {
      'en': 'How do I download Code?',
      'ar': 'كيف يمكنني تنزيل الكود؟',
    },
    'w90sf0li': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'ar':
          'اعرض مجموعة من لقطات الشاشة أو النماذج الجذابة لمجموعة أدوات واجهة المستخدم الخاصة بك لجذب الانتباه وإعطاء المستخدمين لمحة عما يمكنهم توقعه.',
    },
    'rernh4wy': {
      'en': 'How do I download Code?',
      'ar': 'كيف يمكنني تنزيل الكود؟',
    },
    'uyodx5me': {
      'en':
          'Showcase a couple of eye-catching screenshots or mockups of your UI Kit to capture attention and give users a glimpse of what they can expect.',
      'ar':
          'اعرض مجموعة من لقطات الشاشة أو النماذج الجذابة لمجموعة أدوات واجهة المستخدم الخاصة بك لجذب الانتباه وإعطاء المستخدمين لمحة عما يمكنهم توقعه.',
    },
    '253un10w': {
      'en': 'Get support',
      'ar': 'احصل على الدعم',
    },
    'rb6jse8s': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // AdminBills
  {
    'jpc0bp2v': {
      'en': 'چاوەڕوانی',
      'ar': 'الموافقات المعلقة',
    },
    'uw4i0uoq': {
      'en': 'Check and approve the bills',
      'ar': '',
    },
    'hhwwrsue': {
      'en': 'Please check,',
      'ar': '',
    },
    'awz2m05n': {
      'en': ' the picture is sent by user.',
      'ar': '',
    },
    '4mm4pb27': {
      'en': ' if it is ok then approve it',
      'ar': '',
    },
    '6q898m2w': {
      'en': 'جێبەجێکردن',
      'ar': 'مشاريع القوانين قيد التنفيذ',
    },
    'n9qk3r7q': {
      'en': 'Bills you have to pay',
      'ar': '',
    },
    'i4istyf0': {
      'en': 'Great,',
      'ar': '',
    },
    'gmkbgxlm': {
      'en': 'user have paid the bill',
      'ar': '',
    },
    '30pvwdg3': {
      'en': ' please complete the task as soon as possible',
      'ar': '',
    },
    't6koliyw': {
      'en': 'تەواوبوو',
      'ar': 'الطلبات المكتملة',
    },
    'hbizq3xj': {
      'en': 'You have paid the user\'s bill',
      'ar': '',
    },
    'ggqcnezu': {
      'en': 'List',
      'ar': 'قائمة',
    },
  },
  // AdminHome
  {
    'unxe1t5e': {
      'en': 'ڕاپۆرتی دارایی',
      'ar': 'سجلات الفواتير',
    },
    '9kc1t6yr': {
      'en': 'گواستنەوەی پسوولە',
      'ar': 'سجلات الفواتير',
    },
    'qv2eqsux': {
      'en': 'چاوەڕوانی ڕەزامەندی',
      'ar': 'سجلات الفواتير',
    },
    '62sxnvn1': {
      'en': 'لە جێبەچێکردن دایە',
      'ar': 'سجلات الفواتير',
    },
    'rko6gi0a': {
      'en': 'بلۆککردنی بەژداربوو',
      'ar': 'سجلات الفواتير',
    },
    'rgcfgwzn': {
      'en': 'Admin House',
      'ar': '',
    },
    'thskcp6f': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // blockUsers
  {
    'ntm6276b': {
      'en': 'بلۆککردن',
      'ar': '',
    },
    '2zrqwejr': {
      'en': 'You can Block User here',
      'ar': '',
    },
    'rxkebp2h': {
      'en': 'search user',
      'ar': '',
    },
    '56eqlo1t': {
      'en': 'Search',
      'ar': '',
    },
    '131r8d6b': {
      'en': 'Block',
      'ar': '',
    },
    'cf903yve': {
      'en': 'Block',
      'ar': '',
    },
    'r74y4cqr': {
      'en': 'بلۆککراوەکان',
      'ar': '',
    },
    'u2yev1oq': {
      'en': 'You can Unblock User here',
      'ar': '',
    },
    'tduqieil': {
      'en': 'search user',
      'ar': '',
    },
    'fazhzuh1': {
      'en': 'Search',
      'ar': '',
    },
    's0kyj5jk': {
      'en': 'Unblock',
      'ar': '',
    },
    'mdlufooz': {
      'en': 'Unblock',
      'ar': '',
    },
    'dpuha9c1': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // userBlocked
  {
    's3hs5ezs': {
      'en': 'هەژمارەکەت ڕاگیراوە بەهۆی بەکارهێنانی نەشیاو لە بەرنامەکە',
      'ar': '',
    },
    '6z5rhqgi': {
      'en': 'بۆ چاڵاککردنەوەی هەژمارەکەت تکایە پەیوەندی بکە',
      'ar': '',
    },
    '7kw9fipx': {
      'en':
          'We have detected some suspicious activity from your side, which is why your account has been blocked. To unblock your account, kindly contact our support team',
      'ar': '',
    },
    'gggdi9pt': {
      'en': 'Contact Support',
      'ar': 'يدعم',
    },
    '75tyv034': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // LoginPage
  {
    '5uykjkjm': {
      'en': 'Login to Your Account',
      'ar': 'تسجيل الدخول إلى حسابك',
    },
    'tnix81h5': {
      'en': 'Enter your email',
      'ar': '',
    },
    'iwwmk3l3': {
      'en': 'Enter your password',
      'ar': '',
    },
    '6w1o9jwc': {
      'en': 'Forgot password',
      'ar': 'إرسال OTP',
    },
    'f8cepz5y': {
      'en': 'Login',
      'ar': 'إرسال OTP',
    },
    'qp3ygjjb': {
      'en': 'Don\'t have an account, ',
      'ar': '',
    },
    '1wbrwc6m': {
      'en': 'Create account',
      'ar': '',
    },
    '15n73iwl': {
      'en': 'OR',
      'ar': '',
    },
    'sqb3ukcm': {
      'en': 'Continue with Google',
      'ar': 'إرسال OTP',
    },
    'jlb5zlom': {
      'en': 'Continue with Apple',
      'ar': 'إرسال OTP',
    },
    '651xzqi3': {
      'en': 'Enter your email is required',
      'ar': '',
    },
    'bmhnd6ht': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    '9zba5a4q': {
      'en': 'Enter your password is required',
      'ar': '',
    },
    '6xlt5jh6': {
      'en': 'Please choose an option from the dropdown',
      'ar': '',
    },
    'rfl6dvcj': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // forgotPassword
  {
    'mqtknu9e': {
      'en': 'Back',
      'ar': '',
    },
    'rnryhrat': {
      'en': 'Forgot Password',
      'ar': '',
    },
    'i1vcwwmo': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ar': '',
    },
    'sij7we22': {
      'en': 'Your email address...',
      'ar': '',
    },
    '2nyi0113': {
      'en': 'Enter your email...',
      'ar': '',
    },
    'fwzwuwi3': {
      'en': 'Send Link',
      'ar': '',
    },
    '339suv1g': {
      'en': 'Back',
      'ar': '',
    },
    '2yi577mw': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // billTransfer
  {
    'yzyleblw': {
      'en': 'You can Transfer Bills here',
      'ar': 'يمكنك تحويل الفواتير هنا',
    },
    'c1ufrd59': {
      'en': 'search bill by bill number',
      'ar': 'البحث عن الفاتورة حسب رقم الفاتورة',
    },
    '4z7xdm17': {
      'en': 'Search',
      'ar': '',
    },
    'p03hbv2u': {
      'en': 'Change Assigned',
      'ar': '',
    },
    '2gh2db18': {
      'en': 'Change Assigned',
      'ar': '',
    },
    '6pwte5p1': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // FinancialReport
  {
    'mt75do09': {
      'en': 'Today',
      'ar': '',
    },
    'bufz4bd3': {
      'en': 'Week',
      'ar': '',
    },
    'xwtp2xbc': {
      'en': 'Sub Admin',
      'ar': '',
    },
    'ulw6u1id': {
      'en': 'Bills History',
      'ar': '',
    },
    '5j0k407l': {
      'en': 'DATE',
      'ar': '',
    },
    'uqqyea63': {
      'en': 'BILLID',
      'ar': '',
    },
    '3wbccl0z': {
      'en': 'Sub Admin',
      'ar': '',
    },
    'enma4ch7': {
      'en': 'Bill AMOUNT',
      'ar': '',
    },
    '4od7r07j': {
      'en': 'FEE',
      'ar': '',
    },
    'alcjjea7': {
      'en': 'ڕاپۆڕتی دارایی',
      'ar': '',
    },
  },
  // declineBillPage
  {
    '1q43ksw0': {
      'en': 'Contact Admin',
      'ar': 'يدعم',
    },
    'wqq6s0sh': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // empty
  {
    '4qenim17': {
      'en': 'ئاگادارکرنەوە نیە',
      'ar': '',
    },
    'qsjbt4j1': {
      'en': 'It seems that you don\'t have any recent activity.',
      'ar': '',
    },
  },
  // proofPaidBill
  {
    'd16jpaz7': {
      'en': 'بەڵگەی پارەدان',
      'ar': '',
    },
    'zohqhz6m': {
      'en': 'ناردن',
      'ar': '',
    },
  },
  // approveBill
  {
    '2lb54q65': {
      'en': 'پەسەندکردن',
      'ar': '',
    },
    'v1j1x2b7': {
      'en': 'تێچووی بەرنامەکە',
      'ar': '',
    },
    '47j9ths1': {
      'en': 'بڕی پسوولەکە',
      'ar': '',
    },
    'd3ovpj6t': {
      'en': 'پەسەند کردن',
      'ar': '',
    },
    'hmpm2cbl': {
      'en': 'ڕەتکردنەوە',
      'ar': '',
    },
  },
  // SubAdmin
  {
    't2soag8v': {
      'en': 'Choose Sub Admin',
      'ar': '',
    },
  },
  // DeclineBox
  {
    'fm6quxph': {
      'en': 'هۆکاری ڕەتکردنەوە بنوسە',
      'ar': '',
    },
    'zq46z87r': {
      'en': 'ڕەتکردنەوە',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'omy0wa4o': {
      'en': '',
      'ar': '',
    },
    'njgdl9fe': {
      'en': '',
      'ar': '',
    },
    '3a4hulvc': {
      'en': '',
      'ar': '',
    },
    'd2rfemlp': {
      'en': '',
      'ar': '',
    },
    'e9346isc': {
      'en': '',
      'ar': '',
    },
    'stwtxw5f': {
      'en': '',
      'ar': '',
    },
    'v87kc563': {
      'en': '',
      'ar': '',
    },
    'rhwyn907': {
      'en': '',
      'ar': '',
    },
    '6clcbqp4': {
      'en': '',
      'ar': '',
    },
    'm07jt8j8': {
      'en': '',
      'ar': '',
    },
    '7attr03x': {
      'en': '',
      'ar': '',
    },
    'tt9f4ssa': {
      'en': '',
      'ar': '',
    },
    '2jsvvx24': {
      'en': '',
      'ar': '',
    },
    'n0pl3ms5': {
      'en': '',
      'ar': '',
    },
    '7fe8gilk': {
      'en': '',
      'ar': '',
    },
    '6c0zm15o': {
      'en': '',
      'ar': '',
    },
    'limgi7u3': {
      'en': '',
      'ar': '',
    },
    'q718vk1l': {
      'en': '',
      'ar': '',
    },
    '7g6sswgg': {
      'en': '',
      'ar': '',
    },
    'l18ysj9d': {
      'en': '',
      'ar': '',
    },
    '3y885yeh': {
      'en': '',
      'ar': '',
    },
    '1uv4irte': {
      'en': '',
      'ar': '',
    },
    '56c2i6ky': {
      'en': '',
      'ar': '',
    },
    'yc2ziwwh': {
      'en': '',
      'ar': '',
    },
    'pctsundt': {
      'en': '',
      'ar': '',
    },
    'h4o8hubb': {
      'en': '',
      'ar': '',
    },
    'zimy206i': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));

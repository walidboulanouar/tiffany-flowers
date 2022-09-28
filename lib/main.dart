import 'package:easy_localization/easy_localization.dart'  hide TextDirection;
import 'package:ecomerceapp/providers/CartProvider.dart';
import 'package:ecomerceapp/providers/IndexProvider.dart';
import 'package:ecomerceapp/providers/LoadingProvider.dart';
import 'package:ecomerceapp/providers/WishListProvider.dart';
import 'package:ecomerceapp/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/Category.dart';
import 'providers/BannerProvider.dart';
import 'providers/CategoriesProvider.dart';
import 'providers/OrderProvider.dart';
import 'providers/ProductProvider.dart';
import 'providers/UserProvider.dart';
import 'screens/CategoryDetailsScreen.dart';
import 'screens/RegistrationScreen.dart';
import 'screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      startLocale: Locale('en', 'US'),
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AE')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => IndexProvider()),
          ChangeNotifierProvider(create: (context) => CategoriesProvider()),
          ChangeNotifierProvider(create: (context) => ProductProvider()),
          ChangeNotifierProvider(create: (context) => BannerProvider()),
          ChangeNotifierProvider(create: (context) => WishListProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => UserProvider()),
          ChangeNotifierProvider(create: (lontext) => LoadingProvider()),
          ChangeNotifierProvider(create: (context) => OrderProvider()),
        ],
        child: MaterialApp(
            //     localizationsDelegates: [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
        
            // ],
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(fontFamily: "Lucida Calligraphy"),
          title: 'Tiffany Flowers',
          initialRoute: '/',
          routes: {
            '/': (context) => Directionality(
              textDirection: TextDirection.ltr,
              child: SplashScreen()),
          },
        ),
      );
    });
  }
}

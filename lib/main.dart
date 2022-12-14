import 'package:banking_app/data/repositories/auth_repository.dart';
import 'package:banking_app/data/repositories/cards_repository.dart';
import 'package:banking_app/data/repositories/transactions_repository.dart';
import 'package:banking_app/data/services/open_api_service.dart';
import 'package:banking_app/data/services/secure_api_service.dart';
import 'package:banking_app/utils/constants.dart';
import 'package:banking_app/utils/theme.dart';
import 'package:banking_app/view/router.dart';
import 'package:banking_app/view_models/auth_view_model.dart';
import 'package:banking_app/view_models/cards_view_model.dart';
import 'package:banking_app/view_models/pin_view_model.dart';
import 'package:banking_app/view_models/transctions_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  OpenApiService openApiService = OpenApiService();
  SecureApiService secureApiService = SecureApiService();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TransactionViewModel(
            transactionsRepo: TransactionsRepo(
              openApiService: openApiService,
              secureApiService: secureApiService,
            ),
          )
        ),
        ChangeNotifierProvider(
          create: (_) => AuthViewModel(
            authRepository: AuthRepository(openApiService: openApiService),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CardsViewModel(
            cardsRepository:
                CardsRepository(secureApiService: secureApiService),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => PinViewModel(),
        ),
      ],
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en', 'EN'),
          Locale('ru', 'RU'),
          Locale('uz', 'UZ')
        ],
        saveLocale: true,
        fallbackLocale: const Locale('en', 'EN'),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: MyRouter.generateRoute,
      initialRoute: splashRoute,
    );
  }
}

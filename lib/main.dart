import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_app/app/app.dart';
import 'package:movies_app/app/shared/config/injection/injection.dart';
import 'package:movies_app/app/shared/design_system/assets.dart';
import 'package:movies_app/app/shared/utils/custom_shared_preferences/custom_shared_preferences.dart';
import 'package:movies_app/app/shared/utils/error_handler/error_handler.dart';

void main() async {
  // Asegurar que las bindings de widgets estén inicializadas
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializar EasyLocalization
  await EasyLocalization.ensureInitialized();
  // Forzar la orientación de la pantalla en modo vertical
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Configuración de manejo de errores
  ErrorHandler.setupErrorHandling();
  // Cargar variables de entorno
  // Inicializar SharedPreferences
  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.init();
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    debugPrint("No .env file found");
  }
  init(); // Inicializa las dependencias
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('es')],
      path: assetTranslationsRoot,
      fallbackLocale: const Locale('es'),
      child: const App(),
    ),
  );
}

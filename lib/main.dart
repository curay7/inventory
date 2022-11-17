import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'app/data/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Config.supabaseUrl,
    anonKey: Config.supabaseKey,
  );
  // final supabaseClient = SupabaseClient(, ,
  //     autoRefreshToken: true);
  //final store = Store(supabaseClient);

  runApp(
    GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color(0xFF464667),
        ),
      ),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'core/theme/app_theme.dart';

void main() async {
  // Pastikan bindings diinisialisasi
  WidgetsFlutterBinding.ensureInitialized();
  
  // Jalankan aplikasi
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Angkot Chatbot",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system, // Mengikuti tema sistem
      initialRoute: '/chat',
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
      // Error handling
      onInit: () {
        // Initialize services here if needed
      },
      onReady: () {
        // App is loaded and running
      },
      builder: (context, widget) {
        // Wrap entire app with error boundary
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Terjadi kesalahan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Silakan restart aplikasi atau hubungi support jika masalah berlanjut.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        };
        return widget!;
      },
      // Localization settings jika diperlukan
      locale: const Locale('id', 'ID'),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
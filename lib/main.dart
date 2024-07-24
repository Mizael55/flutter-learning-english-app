import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/irregular_verbs_provider.dart';
import 'providers/phrasal_verbs_provider.dart';
import 'providers/providers.dart';
import 'providers/regular_verbs_provider.dart';
import 'screen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegularVerbsProvider()),
        ChangeNotifierProvider(create: (context) => IrregularVerbsProvider()),
        ChangeNotifierProvider(create: (context) => PhrasalVerbsProvider()),
        ChangeNotifierProvider(create: (context) => VocabularyProvider()),
        ChangeNotifierProvider(create: (context) => AdvicesProvider()),
        ChangeNotifierProvider(create: (context) => ExpressionsProvider()),
        ChangeNotifierProvider(create: (context) => ReadingProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Learning english app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

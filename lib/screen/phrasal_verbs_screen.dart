import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/phrasal_verbs_provider.dart';

class PhrasalVerbsScreen extends StatelessWidget {
  const PhrasalVerbsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phrasalVerbs =
        Provider.of<PhrasalVerbsProvider>(context).phrasalVerbs;
    if (phrasalVerbs.isEmpty) {
      Provider.of<PhrasalVerbsProvider>(context).getPhrasalVerbs();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Phrasal Verbs'),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phrasal Verbs'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: phrasalVerbs.length,
        itemBuilder: (context, index) {
          final phrasalVerb = phrasalVerbs[index];
          return ListTile(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('phrasal verb',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20)),
                Text('Meaning',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 20)),
              ],
            ),
            subtitle: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _TextDecoration(text: phrasalVerb.phrasalVerb),
                    _TextDecoration(text: phrasalVerb.spanish),
                  ],
                ),
                _TextDecoration(text: phrasalVerb.example),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TextDecoration extends StatelessWidget {
  const _TextDecoration({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';

class VocabularyScreen extends StatelessWidget {
  const VocabularyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vocabulary = Provider.of<VocabularyProvider>(context).vocabularyList;
    if (vocabulary.isEmpty) {
      Provider.of<VocabularyProvider>(context).getVocabulary();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Vocabularys'),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabularys'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: vocabulary.length,
        itemBuilder: (context, index) {
          final vocab = vocabulary[index];
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _TextDecoration(text: vocab.word),
                _TextDecoration(text: vocab.spanish),
              ],
            ),
            subtitle: Text(vocab.example,
                style: const TextStyle(
                  fontSize: 16.0,
                )),
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
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/irregular_verbs_provider.dart';

class IrregularVerbScreen extends StatelessWidget {
  const IrregularVerbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final irregularVerbsProvider =
        Provider.of<IrregularVerbsProvider>(context).irregularVerbs;

    if (irregularVerbsProvider.isEmpty) {
      Provider.of<IrregularVerbsProvider>(context).getAllVerbs();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Irregular Verbs'),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Irregular Verbs',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Present  -  Past  -  Past Participle  -  Spanish',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            Container(
              height: size.height * 0.8 + 56,
              child: ListView.builder(
                itemCount: irregularVerbsProvider.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _TextDecoration(
                            text: irregularVerbsProvider[index]
                                .english['present']),
                        _TextDecoration(
                            text:
                                irregularVerbsProvider[index].english['past']),
                        _TextDecoration(
                            text: irregularVerbsProvider[index]
                                .english['past_participle']),
                        _TextDecoration(
                            text: irregularVerbsProvider[index].spanish),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _TextDecoration(
                              text: irregularVerbsProvider[index]
                                  .example['present']),
                          _TextDecoration(
                              text: irregularVerbsProvider[index]
                                  .example['past']),
                          _TextDecoration(
                              text: irregularVerbsProvider[index]
                                  .example['past_participle']),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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

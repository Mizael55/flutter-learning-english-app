import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/regular_verbs_provider.dart';

class RegularVerbsScreen extends StatelessWidget {
  const RegularVerbsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final regularVerbsProvider =
        Provider.of<RegularVerbsProvider>(context).regularVerbs;

    if (regularVerbsProvider.isEmpty) {
      Provider.of<RegularVerbsProvider>(context).getAllVerbs();
      return Scaffold(
        appBar: AppBar(
          title: const Text('Regular Verbs'),
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
          'Regular Verbs',
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
              'Present - Past  - P Participle - Spanish',
              style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900],
              ),
            ),
            SizedBox(
              height: size.height * 0.8 + 56,
              child: ListView.builder(
                itemCount: regularVerbsProvider.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      children: [
                        _TextDecoration(
                            text:
                                regularVerbsProvider[index].english['present']),
                                SizedBox(width: 15),
                        _TextDecoration(
                            text: regularVerbsProvider[index].english['past']),
                            SizedBox(width: 12),
                        _TextDecoration(
                            text: regularVerbsProvider[index]
                                .english['past_participle']),
                                SizedBox(width: 10),
                        Expanded(
                          child: _TextDecoration(
                              text: regularVerbsProvider[index].spanish),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          _TextDecoration(
                              text: regularVerbsProvider[index]
                                  .example['present']),
                          _TextDecoration(
                              text:
                                  regularVerbsProvider[index].example['past']),
                          _TextDecoration(
                              text: regularVerbsProvider[index]
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

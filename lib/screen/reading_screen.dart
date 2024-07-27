import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reading_provider.dart';
import '../widgets/card_text.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final readings = Provider.of<ReadingProvider>(context).readings;
    if (readings.isEmpty) {
      Provider.of<ReadingProvider>(context).getReadings();
      return Scaffold(
        appBar: AppBar(
          title: Text('Topics',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title:  Text('Topics',
            style: TextStyle(
                color: Colors.blue[900],
                fontSize: 25.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: readings.length,
        itemBuilder: (context, index) {
          final read = readings[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardText(
                    id: read.id,
                  ),
                ),
              );
            },
            child: ListTile(
              title: _TextDecoration(
                text: read.title,
                color: Colors.blue[900],
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
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
    this.color,
  });

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
